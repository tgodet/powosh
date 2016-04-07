class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy, :request_book]

  # need to add authorization for edit/update/destroy
  def index
    @books = Book.all
    @profile_pics = User::PROFILES_PICS
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "#{@book.title.capitalize} has been created"
      redirect_to book_path(@book)
    else
      flash[:alert] = "Book not created."
      render 'books/new'
    end
  end

  def edit
  end

  def update
    @book.update(book_params)
    if @book.save
      flash[:notice] = "#{@book.title.capitalize} has been updated"
      redirect_to book_path(@book)
    else
      flash[:alert] = "Book not updated."
      render 'books/edit'
    end
  end

  def destroy
    @book.destroy
    flash[:notice] = "Book deleted"
    redirect_to books_path
  end

  # def request_book
  #   flash[:notice] = "Request sent to your friend!"
  #   redirect_to book_path(@book)
  # end

  private

  def book_params
    params.require(:book).permit(
      :title,
      :author,
      :description,
      :language,
      :my_description,
      :isbn
      )
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
