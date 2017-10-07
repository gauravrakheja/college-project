require 'rails_helper'

RSpec.describe Book do 
	
	context 'Validations' do 
		it "has valid validations for email and name" do 
			should validate_presence_of(:name)
			should validate_presence_of(:description)
		end
	end

	context 'Associations' do  
		it "is associated with borrows and users" do 
			should have_many(:users)
			should have_many(:borrows)
		end
	end
	
end