class CustomController < ApplicationController
  before_filter :protected!

  def index
  end

  private

  def protected!
    return if authorized?
    redirect_to(Credential.any? ? edit_credential_path(Credential.first) : new_credential_path)
  end

  def authorized?
    super && session[:provider] == 'custom'
  end
end
