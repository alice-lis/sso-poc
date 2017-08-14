class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  private

  def authorized?
    session[:user_id].present?
  end
end
