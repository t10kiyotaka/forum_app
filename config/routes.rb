Rails.application.routes.draw do
  root to: 'discussions#index'
  resources :discussions
  get '/auth/:provider/callback' => 'sessions#new'
  get '/auth/sign-out' => 'sessions#sign_out', as: :sign_out

end
