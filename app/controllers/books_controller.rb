class BooksController < ApplicationController

  before_action :set_book, only: [:show, :edit, :update, :destroy, :quickedit, :request_book]

  # need to add authorization for edit/update/destroy
  def index
    # can only see friends books. the method ("of_friends") is in book modal
    # and requires the current_user id as a parameter
    # @books = Book.of_friends(current_user)

    # number of books per page defined in model
    @books = policy_scope(Book).paginate(:page => params[:page]).order(created_at: :desc)

    # @books = Book.all
    # @profile_pics = User::PROFILES_PICS
  end

  def borrow
    #no authorizaton
  end

  def search
    #no authorization
    query = "%#{params[:query]}%"
    @books = policy_scope(Book.search_by_title_and_author(query.downcase))
  end

  def sharebook
    # no authorization
  end

  def googleresults
    # no authorization
    google_query = params[:query]
    user_ip = request.remote_ip
    @books = GoogleBooks.search(google_query,{:count => 20}, user_ip)
  end

  def show
    # authorization done
    authorize @book
    @user = User.find(@book.user_id)
  end


  def new
    # authorization done
    @book = Book.new
    authorize @book
  end


  def create
    # authorization done
    if params[:title]
      @book = current_user.books.build(
      author: params[:author],
      title: params[:title],
      language: params[:language],
      isbn: params[:isbn],
      google_cover: params[:google_cover]
      )
      @book.created_with_google = true
      authorize @book
      if @book.save
        redirect_to quickedit_book_path(@book)
      else
        flash[:alert] = "This book has not been added to your library"
        render 'books/new'
      end
    else

      @book = current_user.books.build(book_params)
      authorize @book
      title = @book.title.length > 30 ? "#{@book.title[0..30]}..." : @book.title
      if @book.save
        flash[:notice] = "#{title} has been added to your library"
        redirect_to book_path(@book)
      else
        flash[:alert] = "This book has not been added to your library"
        render 'books/new'
      end
    end

  end






  #ONLY POSSIBLE FOR LOGGED IN USER IF CURRENT USER = Book.user
  def edit
    # authorization done
    #
    # can use policy(@book).update? in the show view to determine
    # whether or not to display update button.
    authorize @book
    # we don't need @user because scope calls current user.
  end


  def quickedit
    authorize @book
  end

     #ONLY POSSIBLE FOR LOGGED IN USER IF CURRENT USER = Book.user
   def update
    # authorization done
    authorize @book
    @book.update(book_params)
    title = @book.title.length > 30 ? "#{@book.title[0..30]}..." : @book.title
    if @book.save && @book.created_with_google
      flash[:notice] = "#{title} has been added to your library"
      redirect_to book_path(@book)
    elsif @book.save
      flash[:notice] = "#{title} has been updated"
      redirect_to book_path(@book)
    else
      flash[:alert] = "Book not updated."
      render 'books/edit'
    end
  end

   #ONLY POSSIBLE FOR LOGGED IN USER IF CURRENT USER = Book.user
   def destroy
    # authorization done
    authorize @book
    @book.destroy
    flash[:notice] = "Book deleted"
    redirect_to library_path
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

end
