class AddFieldsToCredits < ActiveRecord::Migration[5.0]
  def change
    add_column :credits, :state, :string
  end
end
