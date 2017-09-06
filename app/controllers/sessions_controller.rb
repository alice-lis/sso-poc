class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    session[:user_id] = auth[:uid]
    session[:provider] = params[:name]
    redirect_to(params[:redirectUrl] || '/')
  end

  def destroy
    session.destroy
    redirect_to(root_url)
  end
end
