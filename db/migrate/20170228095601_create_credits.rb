class CreateCredits < ActiveRecord::Migration[5.0]
  def change
    create_table :credits do |t|
      t.monetize :amount, currency: { present: false }
      t.monetize  :interest, currency: { present: false }
      t.date :refund_at
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
