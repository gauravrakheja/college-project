class Book < ApplicationRecord
	has_many :borrows
	has_many :users, through: :borrows
	validates :name, presence: true, length: {minimum: 3, maximum: 50}
	validates :description, presence: true, length: {minimum: 10, maximum: 500}
end