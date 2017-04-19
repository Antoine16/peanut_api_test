class RemoveStateFromCredits < ActiveRecord::Migration[5.0]
  def change
    remove_column :credits, :state, :string
  end
end
