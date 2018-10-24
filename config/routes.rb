Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :entries
  resources :datapoints
  get 'token' => 'application#token', as: :token
end
