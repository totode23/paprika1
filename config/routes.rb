Rails.application.routes.draw do
  resources :comments
  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks"
  }
  root 'homes#index'
  resources :homes
  resources :foods
  resources :informs
  resources :settings
  

  get "news" => "homes#news"

  delete :foods, to: 'foods#destroy_all'
end
