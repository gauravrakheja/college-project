require 'rails_helper'

RSpec.describe SessionsController do
	describe 'create' do
		let!(:user) { create(:user) }
		
		it 'should create a user session' do
			put :create, params: { session: {roll_number: user.roll_number, password: user.password} }
			expect(flash[:success]).to be_present
			expect(response).to redirect_to user_path(user)
		end

		it 'should not create a session without authentication' do
			put :create, params: { session: {roll_number: user.roll_number} }
			expect(flash[:danger]).to be_present
			expect(response).to render_template('new')
		end
	end

	describe 'destroy' do
		let!(:user) { create(:user) } 
		
		before do
			allow(controller).to receive(:current_user).and_return(user)
		end

		it 'should destroy the user session' do
			put :destroy, session: {user_id: user.id}
			expect(flash[:success]).to be_present
			expect(response).to redirect_to(root_path)
		end
	end
end