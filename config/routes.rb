Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  
  root "main_page#index"
   
  resources :main_pages
  resources :administrators
  resources :invitation_codes
  resources :users
  resource :session, only: %i[new create destroy]

  
  get "registration" => "invitation_codes#registration", as: "registration" # Для відображення форми
  post "check_code" => "invitation_codes#check_code", as: "check_code"  # Для обробки форми

  get "generate" => "invitation_codes#generate", as: "generate"   

  #get "login" => "users#login", as: "login"
  get "sign_up" => "users#sign_up", as: "sign_up"

  get "about" => "main_page#about", as: "about"

  namespace :admin do
    resources :users, only: [:index, :edit, :update]
  end

end
