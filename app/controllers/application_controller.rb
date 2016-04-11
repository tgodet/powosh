class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  include Pundit

  # can add specific methods below if they require no
  # authorization or if they only need to be scoped.
  after_action :verify_authorized, except:[
    :home, :index, :library,
    :sharebook, :googleresults,
    :borrow, :search
    ], unless: :devise_controller?
  after_action :verify_policy_scoped, only:[
    :index, :search
    ], unless: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end
end
