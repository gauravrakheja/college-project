class BooksController < ApplicationController
	before_action :set_book, only: [:edit, :update, :show, :destroy]

	def new
		@book = Book.new
	end

	def index
		@books = Book.paginate(page: params[:page], per_page: 10)
	end

	def create 
		@book = Book.new(book_params)
		if @book.save
			flash[:success] = "Article was successfully created"
			redirect_to book_path(@book)
		else
			render 'new'
		end
	end

	def show 
	end

	def edit
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
		@book.destroy
		flash[:success] = "The book was successfully deleted"
		redirect_to books_path
	end

	private

		def set_book
			@book = Book.find(params[:id])
		end

		def book_params
			params.require(:book).permit(:name, :author, :publication, :description)
		end

end