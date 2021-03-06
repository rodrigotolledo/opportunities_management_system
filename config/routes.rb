RailsApp::Application.routes.draw do

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"

  root :to => "users#new"

  resources :users
  resources :sessions


  get "sessions/new"
  get "users/new"
  #get "opportunities" => "opportunities#new", :as => "opportunities"

  get '/opportunities/:id/approve', to: 'opportunities#approve', as: 'approve_opportunity'
  resources :opportunities

  get '/opportunities/:id/apply_opportunity', to: 'opportunities#apply_opportunity', as: 'apply_opportunity'
  resources :opportunities_users

  get '/opportunities/:id/show_students', to: 'opportunities#show_students', as: 'show_students'
end
