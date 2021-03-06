setup_lastpass_proc = lambda do |env|
  env['omniauth.strategy'].options[:issuer] = "http://#{ENV.fetch('HOST')}"
  env['omniauth.strategy'].options[:idp_sso_target_url] = 'https://lastpass.com/saml/login/8996082/dc34'
  env['omniauth.strategy'].options[:idp_slo_target_url] = 'https://lastpass.com/saml/logout/8996082/dc34'
  env['omniauth.strategy'].options[:idp_cert_fingerprint] = '38:28:23:D3:BB:BA:E9:7D:75:7C:0B:DF:3A:1B:58:E4:2A:40:49:09'
  env['omniauth.strategy'].options[:name_identifier_format] = "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress"
  env['omniauth.strategy'].options[:idp_sso_target_url_runtime_params] = { :redirectUrl => :RelayState }
end

setup_onelogin_proc = lambda do |env|
  env['omniauth.strategy'].options[:issuer] = "http://#{ENV.fetch('HOST')}"
  env['omniauth.strategy'].options[:idp_sso_target_url] = 'https://anadea-inc-dev.onelogin.com/trust/saml2/http-post/sso/691207'
  env['omniauth.strategy'].options[:idp_slo_target_url] = 'https://anadea-inc-dev.onelogin.com/trust/saml2/http-redirect/slo/691207'
  env['omniauth.strategy'].options[:idp_cert_fingerprint] = 'F9:C2:E2:22:E7:6C:DD:6B:06:6C:27:5C:96:39:2D:1D:ED:F4:70:15'
  env['omniauth.strategy'].options[:name_identifier_format] = "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress"
  env['omniauth.strategy'].options[:idp_sso_target_url_runtime_params] = { :redirectUrl => :RelayState }
  env['omniauth.strategy'].options[:skip_destination] = true
  env['omniauth.strategy'].options[:skip_subject_confirmation] = true
end

setup_okta_proc = lambda do |env|
  env['omniauth.strategy'].options[:issuer] = "http://#{ENV.fetch('HOST')}"
  env['omniauth.strategy'].options[:idp_sso_target_url] = 'https://dev-131242.oktapreview.com/app/anadeaincdev131242_oktapoc_1/exkbl58qg4JAmiTmF0h7/sso/saml'
  env['omniauth.strategy'].options[:idp_slo_target_url] = 'https://dev-131242.oktapreview.com/app/anadeaincdev131242_oktapoc_1/exkbl58qg4JAmiTmF0h7/slo/saml'
  env['omniauth.strategy'].options[:idp_cert_fingerprint] = '62:8D:DA:99:C4:97:12:DC:F3:32:59:04:84:26:57:C4:7E:86:1C:F7'
  env['omniauth.strategy'].options[:name_identifier_format] = "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress"
  env['omniauth.strategy'].options[:idp_sso_target_url_runtime_params] = { :redirectUrl => :RelayState }
  env['omniauth.strategy'].options[:private_key] = File.read(Rails.root.join('crt/sp.key'))
  env['omniauth.strategy'].options[:certificate] = File.read(Rails.root.join('crt/sp.crt'))
  env['omniauth.strategy'].options[:security] = {
    logout_requests_signed: true,
    embed_sign: false,
    digest_method: XMLSecurity::Document::SHA256,
    signature_method: XMLSecurity::Document::RSA_SHA256
  }
end

setup_custom_proc = lambda do |env|
  credential = Credential.first
  env['omniauth.strategy'].options[:issuer] = "http://#{ENV.fetch('HOST')}"
  env['omniauth.strategy'].options[:idp_sso_target_url] = credential.idp_sso_target_url
  env['omniauth.strategy'].options[:idp_slo_target_url] = credential.idp_slo_target_url
  env['omniauth.strategy'].options[:idp_cert_fingerprint] = credential.idp_cert_fingerprint
  env['omniauth.strategy'].options[:name_identifier_format] = credential.name_identifier_format
  env['omniauth.strategy'].options[:idp_sso_target_url_runtime_params] = { :redirectUrl => :RelayState }
  env['omniauth.strategy'].options[:private_key] = File.read(credential.private_key.path)
  env['omniauth.strategy'].options[:certificate] = File.read(credential.certificate.path)
  env['omniauth.strategy'].options[:security] = {
    logout_requests_signed: true,
    embed_sign: false,
    digest_method: XMLSecurity::Document::SHA256,
    signature_method: XMLSecurity::Document::RSA_SHA256
  }
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :saml, name: 'okta',     setup: setup_okta_proc
  provider :saml, name: 'onelogin', setup: setup_onelogin_proc
  provider :saml, name: 'lastpass', setup: setup_lastpass_proc
  provider :saml, name: 'custom', setup: setup_custom_proc
end
