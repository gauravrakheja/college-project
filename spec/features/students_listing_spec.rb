require 'rails_helper'

RSpec.describe 'Students Listing' do
	describe 'list of students' do
		let!(:user) { create(:user) }
		let!(:admin) { create(:admin) }

		it 'shows all the users but the admin user' do
			visit users_path
			expect(page).to have_content(user.username)
			expect(page).not_to have_content(admin.username)
		end
	end
end