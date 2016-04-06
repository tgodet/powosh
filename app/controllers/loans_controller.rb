class LoansController < ApplicationController
  before_action :set_loan, only: [:show, :approve_loan]
  before_action :set_book, only: [:create]
  def index
    @user = User.find(params[:user_id])
    @loans = Loan.where(user_id: @user.id, confirmed: true)
  end

  def show
  end

  def create
    user_id = 1
    @loan = Loan.new
    @loan.book_id = @book.id
    @loan.user_id = user_id
    @loan.pending = true
    if @loan.save
      flash[:notice] = "Request for #{@book.title} sent!"
    else
      flash[:alert] = "There was a problem. No request sent."
    end
    redirect_to book_path(@book)
  end

  def approve_loan
    user_id = @loan.book.user_id
    @user = User.find(user_id)
    @loan.pending = false
    @loan.confirmed = true
    @loan.approved_on = Date.new
    @loan.book.available = false
    # @loan.update
    if @loan.save
      flash[:notice] = "You agreed to lend #{@loan.book.title}!"
    else
      flash[:alert] = "There was a problem. No request sent."
    end
    redirect_to loan_requests_path(@user)
  end

  def reject_loan
    user_id = @loan.book.user_id
    @user = User.find(user_id)
    @loan.rejected = true
    # @loan.update
    if @loan.save
      flash[:notice] = "You rejected the loan request!"
    else
      flash[:alert] = "There was a problem. No change made."
    end
    redirect_to loan_requests_path(@user)
  end

  def open_requests
    @user = User.find(params[:user_id])
    requests = Loan.where(pending: true)
    @requests_from_friends = requests.select do |request|
      request.book.user_id == @user.id
    end
    @requests_to_friends = requests.select do |request|
      request.user_id == @user.id
    end
  end

  private
  def set_loan
    @loan = Loan.find(params[:id])
  end

  def set_book
    @book = Book.find(params[:book_id])
  end
end
