Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#index'

  get '/session/create', to: 'sessions#create'
  get '/session', to: 'sessions#destroy'

  get 'okta', to: 'okta#index'
  get 'onelogin', to: 'onelogin#index'
  get 'lastpass', to: 'lastpass#index'
  get 'custom', to: 'custom#index'

  resource :credential, only: [:new, :create, :edit, :update]
end
