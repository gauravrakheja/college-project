require 'rails_helper'

RSpec.describe Borrow do 

	context 'Associations' do 
		it "should belong to user and book" do 
			should belong_to(:user)
			should belong_to(:book)
		end
	end

	context 'validations' do 
		it 'should validate presence of user id and book id' do 
			should validate_presence_of(:book_id)
			should validate_presence_of(:user_id)
		end
	end

end