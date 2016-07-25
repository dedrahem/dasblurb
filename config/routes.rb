Rails.application.routes.draw do
  puts " "
  puts "Status: app/config/routes.rb   "
  puts " "
  puts "routes.rb : loading routes - begin"

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

  # get "posts/new" => 'posts#new', as: :new_post

  # post "posts" => 'homepage#dashboard', as: :create_post SO WRONG !

  post "posts" => 'posts#create', as: :create_post

  # get "posts" => 'posts#index' repeated in below line

  get "posts" => 'posts#index', as: :posts

  get "posts/:id" => 'posts#show', as: :post

  delete "posts/:id" => 'posts#destroy', as: :destroy_post

  # patch "posts/:id" => 'posts#update'

  # get "posts/:id/edit" => 'posts#edit', as: :edit_post

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :posts,               only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]

  puts "                             "
  puts "routes.rb : loading routes - completed"
  puts " "
  puts "$$>> #{Time.zone.now} "
  puts " "
end
