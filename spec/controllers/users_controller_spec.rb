require 'rails_helper'

RSpec.describe UsersController do
	
	describe 'new' do
		
		it 'should assigns user to a new user' do
			get :new
			expect(assigns(:user)).to be_a_new(User)
		end
	
	end

	describe 'create' do

		context 'with valid params' do
			it 'should create the user and redirect to the library' do
				put :create, params: { user: attributes_for(:user) }
				expect(flash[:success]).to be_present
				expect(response).to redirect_to(books_path)
			end
		end

		context 'with invalid params' do
			it 'should not create the user and render new' do
				put :create, params: { user: {username: 'a', roll_number: '1'} }
				expect(flash[:danger]).to be_present
				expect(response).to render_template("new")
			end
		end

	end

	describe 'edit' do
		let(:user) { create(:user) }

		it 'should find the user' do
			get :edit, params: {id: user.id}
			expect(assigns(:user)).to eq(user)
		end
	end

	describe 'update' do 
		let(:user) { create(:user) }
		let(:user1) { create(:user)}

		context 'valid params' do
			it 'should update the user and redirect to books path' do
				put :update, params: {id: user.id, user: { roll_number: "custom" } }
				expect(assigns(:user)).to eq(user)
				expect(flash[:success]).to be_present
				expect(response).to redirect_to(books_path)
			end

		end

		context 'invalid params' do
			it 'should not update the user and render edit' do
				put :update, params: {id: user.id, user: { roll_number: user1.roll_number} }
				expect(assigns(:user)).to eq(user)
				expect(flash[:danger]).to be_present
				expect(response).to render_template('edit')
			end
		end
	end

	describe 'show' do
		let!(:user) { create(:user) }

		it 'should find the user' do
			get :show, params: {id: user.id}
			expect(assigns(:user)).to eq(user)
			expect(assigns(:user_books)).to eq(user.books)
		end
	end

	describe 'index' do
		let(:user) { create(:user) }
		let(:user1) { create(:user) }
		let(:user2) { create(:user) }
		
		it 'should show all the users' do
			get :index
			expect(assigns(:users)).to eq([user, user1, user2])
		end
	end

end