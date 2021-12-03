# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home#index'
  get '/residential', to: 'home#residential'
  get '/commercial', to: 'home#commercial'
  get '/quote', to: 'home#quote'
  get '/index', to: 'home#index'
  get '/intervention', to: 'home#intervention' 
  post '/create_quotes' =>'quotes#create'
  post '/create_leads' => 'leads#create'
  get '/users/:id' , to: 'users#show'
  get '/users/:id/edit', to: 'users#edit', :as => :user
  patch '/users/:id/edit' => 'users#update'
  get '/update_building/:customer_id', to: 'interventions#updateBuildings'
  get '/update_battery/:building_id', to: 'interventions#updateBattery'
  get '/update_column/:battery_id', to: 'interventions#updateColumn'
  get '/update_elevator/:column_id', to: 'interventions#updateElevator'
  post '/intervention/create_intervention', to: 'interventions#submit'
  resource :intervention

  get 'dropbox/auth' => 'dropbox#auth'
  get 'dropbox/auth_callback' => 'dropbox#auth_callback'
  # get '/audio', to: 'admin/dashboard#file'

  get 'admin/ibm_call' => 'admin/dashboard#ibm_call'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
