Rails.application.routes.draw do
  resources :reactions
  resources :comments
  resources :streaks
  resources :pacts
  resources :actions
  resources :identities
  resources :habits
  resources :users, except: [:new]

  get "/signup" => "users#new", as: "signup"
  delete "/logout" => "sessions#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
