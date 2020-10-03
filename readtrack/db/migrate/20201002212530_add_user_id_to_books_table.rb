class AddUserIdToBooksTable < ActiveRecord::Migration
  def change
    add_columm :books, :user_id, :integer
  end
end
