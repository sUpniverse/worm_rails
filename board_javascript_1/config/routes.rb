Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'boards#index'

  #create
  get '/boards/new' => 'boards#new'
  post '/boards' => 'boards#create'

  #read
  get '/boards' => 'board#index'
  get '/boards/:id' => 'boards#show'  
  
  #update
  get '/boards/:id/edit' => 'boards#edit'
  put '/boards/:id' => 'boards#update'

  #destroy
  delete '/boards/:id' => 'boards#destroy'


  # Sign in
  get '/signin' => 'session#signin'
  post '/signin' => 'session#user_signin'

  post 'boards/:id/like' => 'boards#like_board'

  # Sign out
  delete '/signout' => 'session#signout'

  # Sign up
  get '/signup' => 'session#signup'
  post '/signup' => 'session#user_signup'

  post '/boards/:id/create_comment' =>'boards#create_comment'  

  delete '/boards/:id/comments/:comment_id' => 'boards#destroy_comment'

  post 'boards/:id/comments/:id/like' => 'boards#like_comment'

  put 'boards/:id/comments/:comment_id' => 'boards#update_comment'


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
