class Borrow < ApplicationRecord
  belongs_to :book
  belongs_to :user
  validates  :user_id, presence: true, uniqueness: {case_sensitive: false}
  validates  :book_id, presence: true
end
