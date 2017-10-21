require 'rails_helper'

RSpec.describe "homepage" do
	describe 'for not lgoged user' do

		it 'should show home page' do
			visit root_path
			expect(page).to have_css('.card')
		end
	end

	describe 'logged in user' do
		let(:user) { create(:user) }

		before do
			visit login_path
			fill_in "Roll number", with: user.roll_number
			fill_in "Password", with: user.password
			click_button 'Log In'
		end

		it 'should redirect to books path' do
			visit root_path
			expect(page).to have_content("Welcome to DB Library")
		end
	end
end