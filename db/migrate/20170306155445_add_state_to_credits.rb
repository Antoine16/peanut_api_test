class AddStateToCredits < ActiveRecord::Migration[5.0]
  def change
    add_column :credits, :state, :string, default: "pending"
  end
end
