class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    session[:user_id] = auth[:uid]
    redirect_to(params[:RelayState] || '/')
  end
end
