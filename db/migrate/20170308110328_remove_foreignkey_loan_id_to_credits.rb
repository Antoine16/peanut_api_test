class RemoveForeignkeyLoanIdToCredits < ActiveRecord::Migration[5.0]
  def change
    remove_reference :credits, :loan, index:true
  end
end
