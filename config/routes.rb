Rails.application.routes.draw do
  puts "                               "
  puts " loading: ROUTES.RB, all routes"

  get 'users/new'

  get 'sign_in' => 'sessions#new', as: :sign_in

  post 'sign_in' => 'sessions#create'

  get "/users/new" => 'users#new', as: :sign_up

  post "/users" => 'users#create', as: :users

  delete 'sign_out' => 'sessions#destroy', as: :sign_out

  root 'homepage#dashboard'

  get "homepage" => 'homepage#index', as: :timeline

  get "users" => 'users#index', as: :get_users

  get "users/:id" => 'users#show', as: :user

  get "users/:id/edit" => 'users#edit', as: :edit_user

  patch "users/:id" => 'users#update', as: :update_user

  # post "users" => 'users#create'

  delete "users/:id" => 'users#destroy', as: :delete_user

  patch "users/:id" => 'users#update'

  get "posts" => 'posts#index', as: :posts

  get "posts/new" => 'posts#new', as: :new_post

  post "posts" => 'posts#create'

  get "posts" => 'posts#index'

  get "posts/:id" => 'posts#show', as: :post

  delete "posts/:id" => 'posts#delete'

  patch "posts/:id" => 'posts#update'

  get "posts/:id/edit" => 'posts#edit', as: :edit_post

  puts "                             "

  puts " ****** end of routes *******"
end
