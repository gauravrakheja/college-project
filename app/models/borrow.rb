class Borrow < ApplicationRecord
  belongs_to :book
  belongs_to :user
  validates  :user_id, presence: true
  validates  :book_id, presence: true

  def self.search(search)
  	if search
  		joins(:user, :book).where('users.username LIKE ? or books.name LIKE ?', "%#{search}%", "%#{search}%")
  	else
  		all
  	end
  end

end
