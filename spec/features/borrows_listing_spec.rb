require 'rails_helper'

RSpec.describe 'borrows listing' do
	let!(:user1) { create(:user) }
	let!(:user) { create(:admin) }
	let!(:book) { create(:book) }
	let!(:borrow) { create(:borrow, user: user1, book: book) }

	describe 'admin user' do
		before do
			visit login_path
			fill_in "Roll number", with: user.roll_number
			fill_in "Password", with: user.password
			click_button 'Log In'
		end

		it 'should show the listing of borrowed books' do
			visit borrows_path
			expect(page).to have_content(user1.username)
			expect(page).to have_content(book.name)
			expect(page).to have_link("Received")	
		end
	end

	describe 'normal user' do

		before do
			visit login_path
			fill_in "Roll number", with: user1.roll_number
			fill_in "Password", with: user1.password
			click_button 'Log In'
		end

		it 'should redirect to books listing' do
			visit borrows_path
			expect(page).to have_content("You don't have admin access")
		end
	end
end