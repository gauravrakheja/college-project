require 'rails_helper'

RSpec.describe PagesController do
	describe 'home' do
		describe 'logged in user' do
			let(:user) { create(:user) }

			before do
				allow(controller).to receive(:current_user).and_return(user)
		 	end

		 	it 'should redirect to books path' do
		 		get :home
		 		expect(response).to redirect_to(books_path)
		 	end
		end

		describe 'not logged in user' do
			it 'should render home' do
				get :home
				expect(response).to render_template('home')
			end
		end
	end
end