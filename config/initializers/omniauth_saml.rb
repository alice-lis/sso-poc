Rails.application.config.middleware.use OmniAuth::Builder do
  provider :saml,
  :name                               => "okta",
  :issuer                             => "http://localhost:5000",
  :idp_sso_target_url                 => 'https://dev-131242.oktapreview.com/app/anadeaincdev131242_oktapoc_1/exkbl58qg4JAmiTmF0h7/sso/saml',
  :idp_cert_fingerprint               => '62:8D:DA:99:C4:97:12:DC:F3:32:59:04:84:26:57:C4:7E:86:1C:F7',
  :name_identifier_format             => "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress",
  :idp_sso_target_url_runtime_params  => { :redirectUrl => :RelayState }

  provider :saml,
  :name                               => "onelogin",
  :issuer                             => "http://localhost:5000",
  :idp_sso_target_url                 => 'https://anadea-inc-dev.onelogin.com/trust/saml2/http-post/sso/691207',
  :idp_slo_target_url                 => 'https://anadea-inc-dev.onelogin.com/trust/saml2/http-redirect/slo/691207',
  :idp_cert_fingerprint               => 'F9:C2:E2:22:E7:6C:DD:6B:06:6C:27:5C:96:39:2D:1D:ED:F4:70:15',
  :name_identifier_format             => "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress",
  :idp_sso_target_url_runtime_params  => { :redirectUrl => :RelayState },
  :skip_destination                   => true,
  :skip_subject_confirmation          => true
end
