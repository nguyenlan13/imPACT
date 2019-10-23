Rails.application.routes.draw do
    # resources :reactions
    resources :comments
    resources :streaks
    resources :actions
    resources :identities
    resources :habits
    resources :users, except: [:new]
    
    resources :users do  
        resources :identities, only: [:index, :new, :create]
        resources :streaks, only: [:index]
        resources :comments
    end

    resources :identities do
        resources :users, only: [:show, :index]
        resources :habits
        resources :comments
        resources :reactions
    end

    resources :habits do
        resources :actions
        resources :streaks, only: [:index]
        resources :comments
        resources :reactions
    end

    resources :streaks do
        resources :comments, only: [:index]
        resources :reactions
    end


    get "/signup" => "users#new", as: "signup"
    get "/login" => "sessions#new", as: "login"
    post "/login" => "sessions#create"
    delete "/logout" => "sessions#destroy"
    get "dashboard" => "users#dashboard", as: "dashboard"
    post "/join" => "user_identities#create", as: "join"
    root 'sessions#new'

    # Routes for Google authentication
    get 'auth/:provider/callback', to: 'sessions#googleAuth'
    get 'auth/failure', to: redirect('/')
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
