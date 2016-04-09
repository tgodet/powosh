class BooksController < ApplicationController

  before_action :set_book, only: [:show, :edit, :update, :destroy, :request_book]

  # need to add authorization for edit/update/destroy
  def index
    @books = Book.all
    @profile_pics = User::PROFILES_PICS

    if !current_user.token.nil?
    graph = Koala::Facebook::API.new(current_user.token)
    @friends = graph.get_connections("me", "friends")
  end
  end

  def search
    query = params[:query]
    @books = Book.all
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
      flash[:notice] = "#{@book.title.capitalize} a été ajouté à votre bibliothèque"
      redirect_to book_path(@book)
    else
      flash[:alert] = "Ce livre n'a pas pu être ajouté à votre bibliothèque"
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
