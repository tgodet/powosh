class LoansController < ApplicationController
  before_action :set_loan, only: [:show, :lend_book, :reject_loan, :close_pending, :return_book]
  before_action :set_book, only: [:new, :create, :request_book]
  before_action :update_date, only: [:lend_book, :reject_loan, :close_pending, :return_book]

  def library
    @loans = policy_scope(Loan)
    # these are using scope methods from loan and book modal files.
    @requests_from_friends = Loan.user_action(current_user.id).requested
    @requests_to_friends = Loan.friend_action(current_user.id)
    @returns = Loan.returns(current_user.id)
    @shared = Loan.shared(current_user.id)
    @borrowed = Loan.borrowed(current_user.id)
    @books = Book.of_user(current_user.id)
    @profiles = User.friend_profiles(current_user.id)
  end

  def new
    @loan = Loan.new(book_id: @book.id)
    authorize @loan
  end

  def create
    @loan = Loan.new(loan_params)
    @loan.status = "given"
    @loan.manual = true
    @loan.book_id = @book.id
    @loan.last_action = Date.today

    if @loan.user_id.nil?
      @loan.user_id = current_user.id
      @loan.pending = false
      @loan.action_owner = current_user.id
    else
      @loan.pending = true
      @loan.action_owner = @loan.user_id
    end

    authorize @loan

    if @loan.save
      flash[:notice] = "You loaned #{@book.title}!"
    else
      flash[:alert] = "There was a problem. No loan created."
    end
    redirect_to library_path
  end

  def request_book
    @loan = Loan.new(
      book_id: @book.id,
      user_id: current_user.id,
      status: "requested",
      action_owner: @book.user.id,
      pending: true,
      last_action: Date.today)

    authorize @loan

    if @loan.save
      flash[:notice] = "Request for #{@book.title} sent!"
    else
      flash[:alert] = "There was a problem. No request sent."
    end
    redirect_to books_path
  end

  def lend_book
    authorize @loan
    @loan.action_owner = @loan.user.id
    @loan.status = "given"
    @loan.book.available = false

    if @loan.save
      flash[:notice] = "You gave #{@loan.book.title} to #{@loan.user.profile.first_name}!"
    else
      flash[:alert] = "There was a problem. No request sent."
    end
    redirect_to library_path(current_user)
  end

  def reject_loan
    authorize @loan
    @loan.action_owner = @loan.user.id
    @loan.status = "rejected"

    if @loan.save
      flash[:notice] = "You rejected the loan request!"
    else
      flash[:alert] = "There was a problem. No change made."
    end
    redirect_to library_path(current_user)
  end

  def return_book
    authorize @loan
    @loan.action_owner = @loan.book.user.id
    @loan.status = "returned"
    # owner doesn't need a notification if they returned the book
    # to themselves.
    @loan.pending = current_user.id == @loan.user.id

    if @loan.save
      flash[:notice] = "Book returned!"
    else
      flash[:alert] = "There was a problem. No change made."
    end
    redirect_to library_path(current_user)
  end

  def close_pending
    authorize @loan
    @user = @loan.action_owner
    @loan.pending = false
    if !@loan.save
      flash[:alert] = "There was a problem. No change made."
    end
    redirect_to library_path(current_user)
  end

  private

  def loan_params
    params.require(:loan).permit(:user_id, :borrower_name_manual)
  end

  def set_loan
    @loan = Loan.find(params[:id])
  end

  def set_book
    @book = Book.find(params[:book_id])
  end

  def update_date
    @loan.last_action = Date.today
  end
end
