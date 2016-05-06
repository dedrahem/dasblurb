Rails.application.routes.draw do
  get 'users/new'

  get 'sign_in' => 'sessions#new', as: :sign_in
  post 'sign_in' => 'sessions#create'
  get "/users/new" => 'users#new', as: :sign_up
  post "/users" => 'users#create', as: :users

  root 'homepage#dashboard'

  delete 'sign_in' => 'sessions#delete', as: :sign_out

  get "posts/new" => 'posts#new', as: :new_post
  get "posts" => 'posts#index', as: :posts
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
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
