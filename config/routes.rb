Rails.application.routes.draw do
  get 'users/new'
  get 'sign_in' => 'sessions#new', as: :sign_in
  post 'sign_in' => 'sessions#create'
  delete 'sign_in' => 'sessions#delete', as: :sign_out
  get "/users/new" => 'users#new', as: :sign_up
  post "/users" => 'users#create', as: :users
  root 'homepage#dashboard'
  get "posts" => 'posts#index', as: :posts
  get "posts/new" => 'posts#new', as: :new_post
  get "users" => 'users#index', as: :get_users
  post "users" => 'users#create'
  post "posts" => 'posts#create'
  get "posts" => 'posts#index'
  get "posts/:id" => 'posts#show', as: :post
  delete "posts/:id" => 'posts#delete'
  patch "posts/:id" => 'posts#update'
  get "posts/:id/edit" => 'posts#edit', as: :edit_post
  get "users/:id" => 'users#show', as: :user
  delete "users/:id" => 'users#delete'
  patch "users/:id" => 'users#update'
end
