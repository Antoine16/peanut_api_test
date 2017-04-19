class LoansController < ApplicationController
  before_action :set_loan, only: [:new]
  before_action :capital_total, only: [:index, :cash_out]
  skip_before_action :authenticate_user!, only: [ :new ]

  def index
    @loans = Loan.all
    @loan = Loan.new
  end

  def show
  end

  def new
  end

  def create
    @loan = Loan.new
    @loan.roi = set_roi
    @loan.capital = loan_params[:capital]
    @loan.user = current_user
    if @loan.save
      redirect_to loans_path
    else
      render :new
    end
  end

  def cash_out
    @sum_after_cash_out = @sum.to_i - cashout_params[:retrait].to_i
    respond_to do |format|
      format.js  {}
    end
  end

  def freeze
    respond_to do |format|
      format.js  {}
    end
  end

  private

  def loan_params
    params.require(:loan).permit(:capital, :roi)
  end

  def set_loan
    @loan = Loan.new
  end

  def set_roi
    if loan_params[:roi] == "Sécurité"
      0.03
    elsif loan_params[:roi] == "Tranquilité"
      0.06
    elsif loan_params[:roi] == "Dynamique"
      0.09
    end
  end

  def cashout_params
    params.require(:loan).permit(:retrait)
  end

  def capital_total
    @sum = 0
    if current_user.loans.last == nil
      @sum = 0
    else
    @loans = Loan.all.where(user: current_user)
    @loans.each do |loan|
      @sum += loan.capital
      @sum
      end
    end
  end

end
