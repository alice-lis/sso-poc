Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#index'

  post '/auth/:name/callback', to: 'sessions#create'
  get '/auth/saml/slo', to: 'sessions#destroy'

  get 'okta', to: 'okta#index'
  get 'onelogin', to: 'onelogin#index'
end
