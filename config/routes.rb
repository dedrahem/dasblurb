Rails.application.routes.draw do
  puts " "
  puts " ENTERING ROUTES.RB here."
  puts "   route is:   get users/new "
  get 'users/new'
  puts "   route is:  get sign_in => sessions#new as sign_in path "
  get 'sign_in' => 'sessions#new', as: :sign_in
  puts "   route is: post sign_in => sessions#create  "
  post 'sign_in' => 'sessions#create'
  puts "   route is: get /users/new  => users#new as sign_up"
  get "/users/new" => 'users#new', as: :sign_up
  puts "   route is: post /users => users#create as users"
  post "/users" => 'users#create', as: :users
  puts "   route is: delete sign_out => sessions#destroy as sign_out path"
  delete 'sign_out' => 'sessions#destroy', as: :sign_out
  puts "   route is: root homepage#dashboard"
  root 'homepage#dashboard'
  puts "   route is: get homepage => homepage#index as timeline path"
  get "homepage" => 'homepage#index', as: :timeline
  puts "   route is: get posts => posts#index as posts"
  get "posts" => 'posts#index', as: :posts
  puts "   route is: get posts/new => posts#new as new_post"
  get "posts/new" => 'posts#new', as: :new_post
  puts "   route is: get users => users#index as get_users "
  get "users" => 'users#index', as: :get_users
  puts "   route is: post users => users#create "
  post "users" => 'users#create'
  puts "   route is: post posts => posts#create"
  post "posts" => 'posts#create'
  puts "   route is: get posts => posts#index "
  get "posts" => 'posts#index'
  puts "   route is:   get posts/:id => posts#show, as: :post"
  get "posts/:id" => 'posts#show', as: :post
  puts "   route is:   delete posts/:id => posts#delete"
  delete "posts/:id" => 'posts#delete'
  puts "   route is:   patch posts/:id => posts#update"
  patch "posts/:id" => 'posts#update'
  puts "   route is:   get posts/:id/edit => posts#edit, as: :edit_post"
  get "posts/:id/edit" => 'posts#edit', as: :edit_post
  puts "   route is:   get users/:id => users#show, as: :user"
  get "users/:id" => 'users#show', as: :user
  puts "   route is:   delete users/:id => users#delete"
  delete "users/:id" => 'users#delete'
  puts "   route is:  patch users/:id => users#update"
  patch "users/:id" => 'users#update'
  puts " ****** end routes *******"
end
