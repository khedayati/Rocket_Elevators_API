Rails.application.routes.draw do
  resources :employees
  resources :users
  resources :quotes
  root 'home#index'
  get '/residential', to: 'home#residential'
  get '/commercial', to: 'home#commercial'
  get '/quote', to: 'home#quote'
  get '/index', to: 'home#index'
  post '/create_quotes' =>'quotes#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
