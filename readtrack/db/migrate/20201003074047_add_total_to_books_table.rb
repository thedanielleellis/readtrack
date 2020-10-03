class AddTotalToBooksTable < ActiveRecord::Migration
  def change
    add_column :books, :total, :decimal
  end
end
