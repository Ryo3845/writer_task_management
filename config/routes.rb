Rails.application.routes.draw do
  get 'users/new'
  root "static_pages#home"
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/function", to: "static_pages#function"
  get "/pricing", to: "static_pages#pricing"
  get "/signup", to: "users#new"
  resources :users
  resources :projects
end
