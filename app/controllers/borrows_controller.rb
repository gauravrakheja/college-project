class BorrowsController < ApplicationController

	def index
		require_admin
		@borrows = Borrow.all
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
		if @book.update(book_params)
			flash[:success] = "The Book was successfully updated"
			redirect_to book_path(@book)
		else
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