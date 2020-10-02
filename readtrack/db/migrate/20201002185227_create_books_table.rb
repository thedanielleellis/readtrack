class CreateBooksTable < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :child_name
      t.integer :child_age
      t.string :book_title
      t.string :authors_name
      t.integer :page_count
      t.integer :reading_level
  end
end