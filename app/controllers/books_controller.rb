class BooksController < ApplicationController
	def new
		@book = Book.new
	end

	def index
		@books = Book.all
	end

	def create 
		@book = Book.new(book_params)
		if @book.save
			flash[:notice] = "Article was successfully created"
			redirect_to book_path(@book)
		else
			render 'new'
		end
	end

	def show 
		@book = Book.find(params[:id])
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update(book_params)
		@book = Book.find(params[:id])
		if @book.update(book_params)
			flash[:notice] = "The Book was successfully updated"
			redirect_to book_path(@book)
		else
			render 'edit'
		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		flash[:notice] = "The book was successfully deleted"
		redirect_to books_path
	end

	private
		def book_params
			params.require(:book).permit(:name, :author, :publication, :description)
		end

end