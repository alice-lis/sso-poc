class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    session[:user_id] = auth[:uid]
    session[:provider] = params[:name]
    redirect_to(params[:RelayState] || '/')
  end

  def destroy
    provider = params.require(:provider)
    session.delete(:user_id)
    session.delete(:provider)
    redirect_to("/auth/#{provider}/spslo?RelayState=/")
  end
end
