require 'rails_helper'

RSpec.describe User do 
	context 'Associations' do 
		it 'should have many books and borrows' do
			should have_many(:books)
			should have_many(:borrows)
		end
	end

	context 'Validations' do 
		it 'should validate presence of username and password' do 
			should validate_presence_of(:username)
			should validate_presence_of(:password)
		end
	end
end