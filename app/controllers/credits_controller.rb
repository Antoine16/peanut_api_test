class CreditsController < ApplicationController
  before_action :set_credit, only: [:new, :create ]

  def index
    @credits = Credit.all
  end

  def show
  end

  def new
  end

  def create
    @credit.user = current_user
    if current_user.stripeid == nil
      customer = Stripe::Customer.create(
            :email => params[:stripeEmail],
            :source  => params[:stripeToken],
            :account_balance => @credit.amount_cents,
            :metadata => {"first_name" => current_user.first_name,
                          "last_name" => current_user.last_name,
            }
          )
      current_user.stripeid = customer.id
      current_user.save
      @credit.save
      CreditMailer.credit_confirmation(@credit, current_user).deliver_now
    else
      customer = Stripe::Customer.retrieve(current_user.stripeid)
      customer.account_balance = @credit.amount_cents
      customer.save
      @credit.save
      CreditMailer.credit_confirmation(@credit, current_user).deliver_now
    end
    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_credit_path
  end

  private
  def credit_params
    params.require(:credit).permit(:amount, :interest, :refund_at)
  end

  def set_credit
    @credit = Credit.new(amount: session[:amount])
    @credit.refund_at = (Date.today + session[:nb_days].to_i.days)
    @credit.interest = @credit.amount * (session[:nb_days].to_i) / 100
    @credit.total_amount = @credit.amount + @credit.interest
  end

end



