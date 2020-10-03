class User < ActiveRecord::Base
    has_secure_password
    has_many :books
    validates :username, :email, presence: true
end 