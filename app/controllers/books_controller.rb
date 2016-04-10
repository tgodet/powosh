class BooksController < ApplicationController

  before_action :set_book, only: [:show, :edit, :update, :destroy, :request_book]

  # need to add authorization for edit/update/destroy
  def index
    # can only see friends books. the method ("of_friends") is in book modal
    # and requires the current_user id as a parameter
    # @books = Book.of_friends(current_user.id)

    @books = Book.all
    # @profile_pics = User::PROFILES_PICS
  end

  def search
    query = "%#{params[:query]}%"
    @books = Book.where("lower(title) LIKE ? or author LIKE ?", query.downcase, query.downcase)
  end

  def borrow
  end

  def show
    set_book
    @user = User.find(@book.user_id)
  end

  # only enabled for logged in user
  def new
    @book = Book.new
  end

  # only enabled for logged in user
  def create
    find_user
    @book = @user.books.build(book_params)
    if @book.save
      flash[:notice] = "#{@book.title.capitalize} has been added to your library"
      redirect_to book_path(@book)
    else
      flash[:alert] = "This book has not been added to your library"
      render 'books/new'
    end
  end

  #ONLY POSSIBLE FOR LOGGED IN USER IF CURRENT USER = Book.user
  def edit
    @find_user
  end

   #ONLY POSSIBLE FOR LOGGED IN USER IF CURRENT USER = Book.user
   def update
    find_user
    @book.update(book_params)
    if @book.save
      flash[:notice] = "#{@book.title.capitalize} has been updated"
      redirect_to book_path(@book)
    else
      flash[:alert] = "Book not updated."
      render 'books/edit'
    end
  end

   #ONLY POSSIBLE FOR LOGGED IN USER IF CURRENT USER = Book.user
   def destroy
    @book.destroy
    flash[:notice] = "Book deleted"
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(
      :title,
      :author,
      :description,
      :language,
      :my_description,
      :my_rating,
      :isbn
      )
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def find_user
   @user = User.find(current_user.id)
 end



end
