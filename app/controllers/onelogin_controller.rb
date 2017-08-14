class OneloginController < ApplicationController
  before_filter :protected!

  def index
  end

  private

  def protected!
    return if authorized?
    redirect_to("/auth/onelogin?redirectUrl=#{URI::encode(request.path)}")
  end

  def authorized?
    super && session[:provider] == 'onelogin'
  end
end
