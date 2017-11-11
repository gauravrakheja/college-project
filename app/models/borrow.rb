class Borrow < ApplicationRecord
  belongs_to :book
  belongs_to :user
  validates  :user_id, presence: true
  validates  :book_id, presence: true

  def self.search(keyword)
  	if keyword
  		joins(:user, :book).where('users.username LIKE ? or books.name LIKE ?', "%#{keyword}%", "%#{keyword}%")
  	else
  		all
  	end
  end

end
