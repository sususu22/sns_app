Rails.application.routes.draw do

  devise_for :users

  resources :posts
  resources :users, :only => [:index, :show]

  get "/" => "home#top"
  get "/about" => "home#about"

end
