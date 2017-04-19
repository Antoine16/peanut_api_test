class CreateLoans < ActiveRecord::Migration[5.0]
  def change
    create_table :loans do |t|
      t.monetize :amount_cents

      t.timestamps
    end
  end
end
