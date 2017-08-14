class OktaController < ApplicationController
  before_filter :protected!

  def index
    render text: 'Welcome to Okta'
  end

  private

  def protected!
    return if authorized?
    redirect_to("/auth/okta?redirectUrl=#{URI::encode(request.path)}")
  end

  def authorized?
    super && session[:provider] == 'okta'
  end
end
