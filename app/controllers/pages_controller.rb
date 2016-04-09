class PagesController < ApplicationController
  layout 'home'
  skip_before_action :authenticate_user!, only: :home

  def home
    # user taken to books index as soon as they sign in.
    redirect_to books_path if user_signed_in?
  end
end
