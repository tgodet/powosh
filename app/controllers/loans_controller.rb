class LoansController < ApplicationController
  before_action :set_loan, only: [:show, :approve_loan, :reject_loan]
  before_action :set_book, only: [:create]
  before_action :set_user, only: [:index, :open_requests, :library]
  before_action :set_book_owner, only: [:approve_loan, :reject_loan]

  def index
    @loans = Loan.where(user_id: @user.id, confirmed: true)
  end

  def show
  end

  def library
    open_requests
    @shared = Loan.confirmed.where(user_id: !current_user.id).select do |loan|
      loan.book.user.id == current_user.id
    end
    @borrowed = Loan.confirmed.where(user_id: current_user.id)
    @books = Book.where(user_id: current_user.id)
  end

  def create
    @loan = Loan.new(book_id: @book.id, user_id: current_user.id, pending: true, action_owner: @book.user.id)

    if @loan.save
      flash[:notice] = "Request for #{@book.title} sent!"
    else
      flash[:alert] = "There was a problem. No request sent."
    end

    redirect_to book_path(@book)
  end

  def approve_loan
    @loan.action_owner = @loan.user.id
    @loan.confirmed = true
    @loan.approved_on = Date.new
    @loan.book.available = false

    if @loan.save
      flash[:notice] = "You agreed to lend #{@loan.book.title}!"
    else
      flash[:alert] = "There was a problem. No request sent."
    end
    redirect_to loan_requests_path(@owner)
  end

  def reject_loan
    @loan.rejected = true
    @loan.action_owner = @loan.user.id

    if @loan.save
      flash[:notice] = "You rejected the loan request!"
    else
      flash[:alert] = "There was a problem. No change made."
    end
    redirect_to loan_requests_path(@owner)
  end

  def open_requests
    @loans = Loan.where(user_id: @user.id, confirmed: true)
    requests = Loan.where(pending: true)
    @requests_from_friends = requests.select do |request|
      request.book.user_id == @user.id && !request.confirmed &&!request.rejected
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

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_book_owner
    owner_id = @loan.book.user_id
    @owner = User.find(owner_id)
  end
end
