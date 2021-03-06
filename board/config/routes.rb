Rails.application.routes.draw do
  
  root 'post#index'

  get 'post/index' => 'post#index'

  get 'post/new'   => 'post#new'

  get 'post/create' => 'post#create'

  get 'post/show/:id' => 'post#show'

  get 'post/destroy/:id' => 'post#destroy'

  get 'post/edit/:id' => 'post#edit'

  get 'post/update/:id' => 'post#update'

  get 'post/comment_add' => 'post#comment_add'
  get 'post/comment_edit/:id' => 'post#comment_edit'
  get 'post/comment_update/:id' => 'post#comment_update'
  get 'post/comment_destroy/:id' => 'post#comment_destroy'

  get  'user/new' => 'user#new'
  post 'user/create' => 'user#create'
  post 'user/login_process' =>'user#login_process'
  get  'user/logout' => 'user#logout'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  

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
