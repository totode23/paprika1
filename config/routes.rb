Rails.application.routes.draw do
  get 'settings/index'
  resources :comments
  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks"
  }
  root 'homes#index'
  resources :homes
  resources :foods
  resources :settings

  get "news" => "homes#news"

  delete :foods, to: 'foods#destroy_all'
end
