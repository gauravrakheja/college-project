class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update, :show]

	def new 
		@user = User.new
	end

	def create 
		@user = User.new(user_params)
		if @user.save 
			flash[:success] = "Welcome to the Library #{@user.username}"
			redirect_to books_path 
		else
			flash[:danger] = "#{@user.errors.messages}"
 			render 'new'
		end
	end

	def edit
	end

	def update
		if @user.update(user_params)
			flash[:success] = "Your account was updates successfully"
			redirect_to books_path
		else
			flash[:danger] = "#{@user.errors.messages}"
			render  'edit'
		end
	end	

	def show
		@user_books = @user.books.paginate(page: params[:page],per_page: 5)
	end	

	def index
		@users = User.all
	end

	private 
		def user_params
			params.require(:user).permit(:username, :roll_number, :password)
		end

		def set_user
			@user = User.find(params[:id])
		end
end