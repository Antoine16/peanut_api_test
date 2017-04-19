class AddTotalAmountToCredits < ActiveRecord::Migration[5.0]
  def change
    add_monetize :credits, :total_amount, currency: { present: false }
  end
end
