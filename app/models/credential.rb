class Credential < ApplicationRecord
  has_attached_file :private_key
  do_not_validate_attachment_file_type :private_key

  has_attached_file :certificate
  do_not_validate_attachment_file_type :certificate

  validates :idp_sso_target_url, :idp_slo_target_url, :idp_cert_fingerprint, :name_identifier_format, presence: true
end
