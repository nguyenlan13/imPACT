Rails.application.routes.draw do
  resources :comments
  resources :streaks
  resources :pacts
  resources :actions
  resources :identities
  resources :habits
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
