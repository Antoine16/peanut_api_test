class AddColumnToLoans < ActiveRecord::Migration[5.0]
  def change
    add_column :loans, :roi, :float
  end
end
