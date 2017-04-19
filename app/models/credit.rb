class Credit < ApplicationRecord
  belongs_to :user

  monetize :amount_cents
  monetize :interest_cents
  monetize :total_amount_cents


  def self.payable
    @credits = Credit.where(refund_at: Date.today, state: 'pending')
    @credits.each do |credit|
      charge = Stripe::Charge.create(
          :amount => credit.total_amount_cents,
          :currency => "eur",
          :description => "Credit Peanut du #{credit.created_at.strftime("%d/%m/%Y")}",
          :customer => credit.user.stripeid,
        )
      customer = Stripe::Customer.retrieve(credit.user.stripeid)
      customer.account_balance -= credit.total_amount_cents
      customer.save
      credit.state = "paid"
      credit.save
    end
  end
end
