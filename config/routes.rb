Rails.application.routes.draw do
  resources :characters, only: [ :index ]
  resources :easy_characters, only: [ :index ]
  resources :med_characters, only: [ :index ]
  resources :timers, only: [ :create, :update ]
  resources :high_scores, only: [ :index ]
  resources :easy_high_scores, only: [ :index ]
  resources :med_high_scores, only: [ :index ]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
