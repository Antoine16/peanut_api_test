class AddLoanRefToCredit < ActiveRecord::Migration[5.0]
  def change
    add_reference :credits, :loan, foreign_key: true
  end
end
