class CredentialsController < ApplicationController
  def new
    @credential = Credential.new
  end

  def create
    @credential = Credential.new(credential_params)
    if @credential.save
      redirect_to(("/auth/custom?redirectUrl=#{URI::encode(request.path)}"))
    else
      render :new
    end
  end

  def edit
    @credential = Credential.first
  end

  def update
    @credential = Credential.first
    if @credential.update(credential_params)
      redirect_to('/auth/custom?redirectUrl=/custom')
    else
      render :edit
    end
  end

  private

  def credential_params
    params.require(:credential)
      .permit(:idp_sso_target_url, :idp_slo_target_url, :idp_cert_fingerprint,
        :name_identifier_format, :private_key, :certificate)
  end
end
