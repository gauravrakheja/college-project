class BorrowsController < ApplicationController

	def index
		require_admin
		@borrows = Borrow.search(params[:search])
		if @borrows.try(:empty?)
			render 'shared/_not_found' and return
		end
	end

	def create
		@borrow = Borrow.new(borrows_params)
		if @borrow.save
			flash[:success] = "Thank you for borrowing the book"
			redirect_to books_path
		else 
			flash[:danger] = "There was an error in adding the book to your account"
			redirect_to books_path
		end
	end

	def edit
		@borrow = Borrow.find(params[:id])
	end

	def update
		@borrow = Borrow.find(params[:id])
		if @borrow.update(borrows_params)
			flash[:success] = "The Borrow was successfully updated"
			redirect_to books_path
		else
			flash[:danger] = "There was an error"
			render 'edit'
		end
	end

	def destroy
		@borrow = Borrow.find(params[:id])
		@borrow.destroy
		flash[:success] = "The book has been returned"
		redirect_to borrows_path
	end

	private 
		def borrows_params
			params.require(:borrow).permit(:user_id, :book_id)
		end

end