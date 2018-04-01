Rails.application.routes.draw do
  devise_for :users

  resources :users, :only => [:index, :show]

  get "posts/new" => "posts#new"
  get "posts/index" => "posts#index"
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"




  get "/" => "home#top"
  get "/about" => "home#about"



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
