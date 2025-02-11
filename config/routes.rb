Rails.application.routes.draw do
  resource :session, only: [ :new, :create, :destroy ]
  resources :passwords, only: %i[new create edit update], param: :token
  resources :accounts
  resources :profiles
  resources :instructors
  resources :students
  resources :courses
  resources :enrollments, only: %i[index show new create]
  resource :landing, only: %i[show]
  resources :admins, only: %i[index show new create destroy]
  resources :admin_requests, only: %i[index show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  root "landings#show"
  match "*unmatched", to: "application#not_found_method", via: :all
end
