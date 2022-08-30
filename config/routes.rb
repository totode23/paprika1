Rails.application.routes.draw do
  resources :comments
  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks"
  }
  root 'homes#index' 
  get "top" => "homes#top"
  get "invitation" => "homes#invitation"
  get "food" => "homes#food"
  get "register" => "homes#register"
  post "create" => "homes#create"
  get "news" => "homes#news"
  get "setting" => "homes#setting"
end
