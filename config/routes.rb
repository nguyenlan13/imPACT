Rails.application.routes.draw do
    resources :reactions
    resources :comments
    resources :streaks
    resources :actions
    resources :identities
    resources :habits
    resources :users, except: [:new]
    
    resources :users, only: [:show] do  
        resources :identities, only: [:index, :new, :create]
    end

    resources :identities, only: [:show] do
        resources :habits, only: [:index, :new, :create]
    end

    resources :habits, only: [:show] do
        resources :actions, only: [:index, :new, :create]
    end

    get "/signup" => "users#new", as: "signup"
    get "/login" => "sessions#new", as: "login"
    post "/login" => "sessions#create"
    delete "/logout" => "sessions#destroy"
    get 'dashboard' => "users#dashboard", as: "dashboard"
    
    # Routes for Google authentication
    get 'auth/:provider/callback', to: 'sessions#googleAuth'
    get 'auth/failure', to: redirect('/')
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
