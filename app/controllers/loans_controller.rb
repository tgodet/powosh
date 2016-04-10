class LoansController < ApplicationController
  before_action :set_loan, only: [:show, :approve_loan, :reject_loan, :close_pending]
  before_action :set_book, only: [:create]
  before_action :update_date, only: [:create, :approve_loan, :reject_loan, :close_pending]

  def index
    @loans = Loan.where(user_id: current.id, confirmed: true)
  end

  def show
  end

  def library
    # these are using scope methods from loan and book modal files.
    @requests_from_friends = Loan.user_action(current_user.id).requested
    @requests_to_friends = Loan.friend_action(current_user.id)
    @shared = Loan.shared(current_user.id)
    @borrowed = Loan.borrowed(current_user.id)
    @books = Book.of_user(current_user.id)
  end

  def create
    @loan = Loan.new(
      book_id: @book.id,
      user_id: current_user.id,
      status: "requested",
      action_owner: @book.user.id,
      pending: true,
      last_action: Date.today)

    if @loan.save
      flash[:notice] = "Request for #{@book.title} sent!"
    else
      flash[:alert] = "There was a problem. No request sent."
    end
    redirect_to book_path(@book)
  end

  def approve_loan
    @loan.action_owner = @loan.user.id
    @loan.status = "approved"
    @loan.book.available = false

    if @loan.save
      flash[:notice] = "You agreed to lend #{@loan.book.title}!"
    else
      flash[:alert] = "There was a problem. No request sent."
    end
    redirect_to library_path(current_user)
  end

  def reject_loan
    @loan.action_owner = @loan.user.id
    @loan.status = "rejected"

    if @loan.save
      flash[:notice] = "You rejected the loan request!"
    else
      flash[:alert] = "There was a problem. No change made."
    end
    redirect_to library_path(current_user)
  end

  def close_pending
    @user = @loan.action_owner
    @loan.pending = false
    if !@loan.save
      flash[:alert] = "There was a problem. No change made."
    end
    redirect_to library_path(current_user)
  end

  private

  def loan_params
    params.require(:loan).permit(:status, :action_owner, :pending)
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
