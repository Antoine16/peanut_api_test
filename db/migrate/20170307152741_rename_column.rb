class RenameColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :loans, :amount_cents_cents, :capital_cents
  end
end
