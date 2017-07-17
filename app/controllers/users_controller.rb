class UsersController < ApplicationController
	def new 
		@user = User.new
	end

	def create 
		@user = User.new(user_params)
		if @user.save 
			flash[:success] = "Welcoe to the Library #{@user.username}"
			redirect_to books_path 
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:success] = "Your account was updates successfully"
			redirect_to books_path
		else
			render  'edit'
		end
	end	

	def show
		@user = User.find(params[:id])
		@user_books = @user.books.paginate(page: params[:page].per_page: 5)
	end	

	def index
		@users = User.all
	end

	private 
		def user_params
			params.require(:user).permit(:username, :rolln_number, :password)
		end
end