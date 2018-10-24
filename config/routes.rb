Rails.application.routes.draw do
  root 'welcome#index'
  scope module: 'api' do
    namespace :v1 do
      # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
      
      resources :users
      resources :entries
      resources :datapoints
      get 'token' => 'application#token', as: :token
    end
  end
end
