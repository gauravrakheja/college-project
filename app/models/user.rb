class User < ApplicationRecord
	has_many :borrows, dependent: :destroy
	has_many :books, through: :borrows
	validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 3, maximum: 25}
	validates :roll_number, presence: true, uniqueness: {case_sensitive: false}
	has_secure_password
end