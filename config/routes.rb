Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#index'

  post '/auth/:name/callback', to: 'sessions#create'
  match '/auth/saml/slo', to: 'sessions#destroy', via: [:get, :post]

  get 'okta', to: 'okta#index'
  get 'onelogin', to: 'onelogin#index'
  get 'lastpass', to: 'lastpass#index'
  get 'custom', to: 'custom#index'

  resource :credential, only: [:new, :create, :edit, :update]
end
