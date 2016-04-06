class LoansController < ApplicationController
  before_action :set_loan, only: [:show, :approve_loan]
  before_action :set_book, only: [:create]
  def index
    @loans = Loan.all
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
    @user = User.find(1)
    @loan.pending = false
    @loan.confirmed = true
    # @loan.update
    if @loan.save
      flash[:notice] = "You agreed to lend this book!"
    else
      flash[:alert] = "There was a problem. No request sent."
    end
    redirect_to user_loans_path(@user)
  end

  private
  def set_loan
    @loan = Loan.find(params[:id])
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
