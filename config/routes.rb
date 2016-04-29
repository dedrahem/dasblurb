Rails.application.routes.draw do
  get 'posts/index'

  get 'posts/show'

  get 'posts/new'

  get 'posts/edit'

  get 'posts/create'

  get 'posts/update'

  get 'posts/destroy'

  get 'followers/index'

  get 'followers/show'

  get 'followers/new'

  get 'followers/edit'

  get 'followers/create'

  get 'followers/update'

  get 'followers/destroy'

  get 'users/index'

  get 'users/show'

  get 'users/new'

  get 'users/edit'

  get 'users/create'

  get 'users/update'

  get 'users/destroy'

  get 'homepage/index'

  get 'homepage/show'

  get 'homepage/new'

  get 'homepage/edit'

  get 'homepage/create'

  get 'homepage/update'

  get 'homepage/destroy'

  get 'dashboard/index'

  get 'dashboard/show'

  get 'dashboard/new'

  get 'dashboard/edit'

  get 'dashboard/create'

  get 'dashboard/update'

  get 'dashboard/destroy'

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
end
