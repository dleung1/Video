Rails.application.routes.draw do

  # Main controller
  # Home page
  root 'main#home'

  # User controller
  # Sign up
  get 'create'		=>	'user#create'
  post'try_create'	=>	'user#try_create'

  # Log in
  get 'login'		=>	'user#login'
  post'logout'		=>	'user#logout'
  post'try_login'	=>	'user#try_login'

  # Video Library
  get 'u/library'	=>	'user#V_library'

  # Settings page
  get 'u/edit'		=>	'user#edit'
  post'u/try_edit'	=>	'user#try_edit'

  # Show user
  get 'u/:id'		=>	'user#show', as: :user


  # Video controller
  # Create Video
  get 'v/create'	=>	'video#create'
  post'/v/try_create'	=>	'video#try_create'

  # Search Video
  get 'v/search'	=>	'video#search', as: 'search'

  # Show Video
  get 'v/:id'		=>	'video#show', as: 'video'
  post'v/:id/Download'	=>	'video#Download'

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
