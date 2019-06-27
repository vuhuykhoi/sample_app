Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/help", to: "static_pages#help"
    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"
    get "signup", to: "users#new"
    post "signup", to: "users#create"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :users
  end
  resources :account_activations, only: [:edit]
  get "password_resets/new"
  get "password_resets/edit"
  resources :password_resets, only: [:new, :create, :edit, :update]
end
