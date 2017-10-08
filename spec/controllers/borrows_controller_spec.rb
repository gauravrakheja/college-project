require 'rails_helper'

RSpec.describe BorrowsController do
	describe 'index' do
		let(:user1) { create(:user) }
		let(:user2) { create(:user) }
		let(:book) { create(:book) }
		let(:book1) { create(:book) }

		context 'when user is admin' do
			let(:user) { create(:admin) }
			let(:borrow2)  { create(:borrow, user: user1, book: book)}
			let(:borrow) { create(:borrow, user: user2, book: book1)}

			before do
				allow(controller).to receive(:current_user).and_return(user)
			end

			it 'assign borrows to all borrows' do
				get :index
				expect(assigns(:borrows)).to eq([borrow2, borrow])
			end
		end
	end

	describe 'create' do
		let(:user) { create(:user) }
		let(:book) { create(:book) }

		describe 'valid params' do
			let(:borrow) { {user_id: user.id, book_id: book.id} }

			it 'should save the borrow' do
				post :create, params: { borrow: borrow }
				expect(flash[:success]).to be_present
				expect(response).to redirect_to(books_path)
			end
		end
		describe 'invalid params' do

			it 'should not save the borrow' do
				post :create, params: { borrow: { user_id: 123, book_id: 456} }
				expect(flash[:danger]).to be_present
				expect(response).to redirect_to(books_path)
			end
		end
	end

	describe 'edit' do
		let(:user) { create(:user) }
		let(:book) { create(:book) }
		let(:borrow) { create(:borrow, user: user, book: book) }

		it 'should find the book' do
			get :edit, params: { id: borrow.id }
			expect(assigns(:borrow)).to eq(borrow)
		end
	end

	describe 'udpate' do
		let(:user) { create(:user) }
		let(:book) { create(:book) }
		let(:user1) { create(:user) }
		let(:borrow) { create(:borrow, user: user, book: book) }

		context 'valid params' do
			it 'should update the borrow and redirect to books path' do
				post :update, params: { id: borrow.id, borrow: {book_id: borrow.book_id, user_id: user1.id} }
				expect(flash[:success]).to be_present
				expect(response).to redirect_to(books_path)
			end
		end

		context 'invalid params' do
			it 'should not update the borrow' do	
				post :update, params: { id: borrow.id, borrow: {book_id: borrow.book_id, user_id: 124}}
				expect(flash[:danger]).to be_present
				expect(response).to render_template('edit')
			end
		end

	end

	describe 'destroy' do
		let(:user) { create(:user) }
		let(:book) { create(:book) }
		let(:borrow) {create(:borrow, book: book, user: user)}

		it 'should find the book' do
			put :destroy, params: { id: borrow.id }
			expect(assigns(:borrow)).to eq(borrow)
		end

		it 'should show flash message and redirect to borrows path' do
			put :destroy, params: { id: borrow.id }
			expect(flash[:success]).to be_present
			expect(response).to redirect_to(borrows_path)
		end

	end
end