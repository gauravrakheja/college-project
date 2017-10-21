require 'rails_helper'

RSpec.describe 'login page' do
	let!(:book) { create(:book) }
	
	describe 'logged in user' do
		let!(:user) { create(:user) }
		
		before do
			visit login_path
			fill_in "Roll number", with: user.roll_number
			fill_in "Password", with: user.password
			click_button 'Log In'
		end
		
		it 'should show borrow button for books' do
			visit books_path
			expect(page).to have_content(book.name)
			expect(page).to have_content(book.description)
			expect(page).to have_button('Borrow')
		end
	end

	describe 'logged out user' do
		it 'should just show the books listing' do
			visit books_path
			expect(page).to have_content(book.name)
			expect(page).to have_content(book.description)
		end
	end

	describe 'admin user' do
		let(:user) { create(:admin) }

		before do
			visit login_path
			fill_in "Roll number", with: user.roll_number
			fill_in "Password", with: user.password
			click_button 'Log In'
		end

		it 'should show the edit and delete button with other details' do
			visit books_path
			expect(page).to have_content(book.name)
			expect(page).to have_content(book.description)
			expect(page).to have_link("Edit this book")
			expect(page).to have_link("Delete this book")
			expect(page).to have_button('Borrow')
		end
	end
end