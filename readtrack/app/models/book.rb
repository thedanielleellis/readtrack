class Book < ActiveRecord::Base
    belongs_to :user
    validates :child_name, :child_age, :book_title, :authors_name, :page_count, :reading_level, :user_id, presence: true
end 