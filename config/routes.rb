Rails.application.routes.draw do
  puts " "
  puts " ENTERING ROUTES.RB here."
  puts "   route is:   get users/new "
  get 'users/new'
  puts "   route is:  get sessions#new as sign_in path "
  get 'sign_in' => 'sessions#new', as: :sign_in
  puts "   route is: post sign_in sessions action create  "
  post 'sign_in' => 'sessions#create'
  puts "   route is : get /users/new  rocketman users action new as sign_up"
  get "/users/new" => 'users#new', as: :sign_up
  puts "   route is: post /users rocketman users action create as users"
  post "/users" => 'users#create', as: :users
  puts "   route is : delete sign_out rkt sessions act destroy as sign_out path"
  delete 'sign_out' => 'sessions#destroy', as: :sign_out
  puts "   route is : root homepage act dashboard"
  root 'homepage#dashboard'
  puts "   route is : get homepage rkt homepage act index as timeline path"
  get "homepage" => 'homepage#index', as: :timeline
  puts "   route is : get posts rkt posts act index as posts"
  get "posts" => 'posts#index', as: :posts
  puts "   route is : get posts/new rkt posts act new as new_post"
  get "posts/new" => 'posts#new', as: :new_post
  puts "   route is : get users users#index as get_users "
  get "users" => 'users#index', as: :get_users
  puts "   route is : post users rkt users#create "
  post "users" => 'users#create'
  puts "   route is: post posts rkt postsAcreate"
  post "posts" => 'posts#create'
  puts "   route is : get posts rkt postsAindex "
  get "posts" => 'posts#index'
  puts "   line 32"
  get "posts/:id" => 'posts#show', as: :post
  delete "posts/:id" => 'posts#delete'
  patch "posts/:id" => 'posts#update'
  get "posts/:id/edit" => 'posts#edit', as: :edit_post
  get "users/:id" => 'users#show', as: :user
  delete "users/:id" => 'users#delete'
  patch "users/:id" => 'users#update'
end
