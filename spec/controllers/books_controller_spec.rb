require 'rails_helper'

RSpec.describe BooksController do 

	describe "index" do 
		it "assigns @books" do 
			book = Book.create(name: "test", description: "This is for the purpose of testing")
			get :index
			expect(assigns(:books)).to eq([book])
		end

		it 'renders the index template' do 
			get :index 
			expect(response).to render_template("index")
		end
	end

	describe "new" do 
		it "assigns a new book to @book" do 
			get :new 
			expect(assigns(:book)).to be_a_new(Book)
		end
	end

	describe 'create' do
		describe 'valid params' do
			let(:book) { {name: "test book", description: "Test description for test book"}}

			it 'should save the book and show flash mssage' do
				post :create, params: { book: book }
			end
		end

		describe 'invalid params' do
			let(:book) {{ name: "a", description: "bad" } }

			it 'should render new template' do
				post :create, params: { book: book }
				expect(response).to render_template("new")
			end
		end
	end

	describe "edit" do
	let!(:book) { Book.create!(name: "test book", id: 10, author: "flee", publication: "skyward", description: "Test description for book") }
		it 'should find the book' do
			get :edit, :params =>{id: book.id}
			expect(assigns(:book)).to eq(book)
		end
	end

	describe 'update' do
		describe 'valid params' do
			let!(:book) { Book.create!(name: "test book", id: 10, author: "something", publication: "skyward", description: "Test description for test book") }
			
			it 'should save the book and show flash message' do
				post :update, :params => {id: book.id, book: { name: "new name"}}
			end
		end

		describe 'invalid params' do
			let!(:book) { Book.create!(name: "test book", id: 10, author: "something", publication: "skyward", description: "Test description for book") }

			it 'should not save the book and render edit' do
				post :update, params: {id: book.id,book: { name: "a"} }
				expect(response).to render_template("edit")
			end
		end
	end
end