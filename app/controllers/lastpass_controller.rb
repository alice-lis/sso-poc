class LastpassController < ApplicationController
  before_filter :protected!

  def index
  end

  private

  def protected!
    return if authorized?
    redirect_to("/auth/lastpass?redirectUrl=#{URI::encode(request.path)}")
  end

  def authorized?
    super && session[:provider] == 'lastpass'
  end
end
