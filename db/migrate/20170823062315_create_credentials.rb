class CreateCredentials < ActiveRecord::Migration[5.0]
  def change
    create_table :credentials do |t|
      t.string :idp_sso_target_url
      t.string :idp_slo_target_url
      t.string :idp_cert_fingerprint
      t.string :name_identifier_format
      t.attachment :private_key
      t.attachment :certificate

      t.timestamps
    end
  end
end
