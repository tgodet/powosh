class BooksController < ApplicationController

  before_action :set_book, only: [:show, :edit, :update, :destroy, :request_book]

  # need to add authorization for edit/update/destroy
  def index
    # can only see friends books. the method ("of_friends") is in book modal
    # and requires the current_user id as a parameter
    # @books = Book.of_friends(current_user.id)
    # @books = policy_scope(Book)
    @books = Book.all
    # @profile_pics = User::PROFILES_PICS
  end

  def borrow
  end

  def search
    query = "%#{params[:query]}%"
    @books = Book.search_by_title_and_author(query.downcase)
    # @books = Book.where("lower(title) LIKE ? or author LIKE ?", query.downcase, query.downcase)
    # @books = policy_scope(Book.where("lower(title) LIKE ? or author LIKE ?", query.downcase, query.downcase))
  end

  def sharebook

  end

  def googleresults
    google_query = params[:query]
    user_ip = request.remote_ip
    @books = GoogleBooks.search(google_query,{:count => 20}, user_ip)
  end

  def show
    # authorize @book
    @user = User.find(@book.user_id)
  end

  # only enabled for logged in user
  def new

    @book = Book.new
    # authorize @book

  end

  # only enabled for logged in user
  def create
    find_user


    if params[:title]

      @book = @user.books.build(
      author: params[:author],
      title: params[:title],
      language: params[:language],
      isbn: params[:isbn],
      google_cover: params[:google_cover]
      )
    else

      @book = @user.books.build(book_params)
    end

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
      :isbn,
      :photo,
      :photo_cache
      )
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def find_user
   @user = User.find(current_user.id)
 end



end
