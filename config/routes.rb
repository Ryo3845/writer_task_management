Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  root "static_pages#home"
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/function", to: "static_pages#function"
  get "/pricing", to: "static_pages#pricing"
  get "/terms", to: "static_pages#terms"
  get "/privacy_policy", to: "static_pages#privacy_policy"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users
  resources :projects
end
