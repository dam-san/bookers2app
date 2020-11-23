Rails.application.routes.draw do
  # get 'home/top'
  # get 'home/about'
  get 'home/about' => "homes#about"
  root 'homes#top'
  devise_for :users

  resources :users
  resources :books

end