class User < ActiveRecord::Base
	has_many :books
	validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 3, maximum: 25}
	validates :roll_number, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 10, maximum: 12}
end