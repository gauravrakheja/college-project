class BooksController < ApplicationController
	before_action :set_article, only: [:edit, :update, :show, :destroy]

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
	end

	def edit
	end

	def update(book_params)
		if @book.update(book_params)
			flash[:notice] = "The Book was successfully updated"
			redirect_to book_path(@book)
		else
			render 'edit'
		end
	end

	def destroy
		@book.destroy
		flash[:notice] = "The book was successfully deleted"
		redirect_to books_path
	end

	private

		def set_article
			@article = Article.find(params[:id])
		end

		def book_params
			params.require(:book).permit(:name, :author, :publication, :description)
		end

end