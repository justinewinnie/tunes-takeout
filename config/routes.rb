Rails.application.routes.draw do
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


  root 'suggestions#index'

  get '/suggestions' =>  'suggestions#show'
  post '/suggestions' =>  'suggestions#show'

  post 'suggestions' => 'suggestions#index', as: 'search'

  get '/login' => 'sessions#new'

  get 'auth/:provider/callback' => 'sessions#create'

  get '/suggestions/new' => 'suggestions#new'
  post '/suggestions/new' => 'suggestions#create'

  delete '/logout' => 'sessions#destroy'

  get '/users/:user_id/favorites' => 'users#favorites'

  get '/suggestions/:user_id/favorites/new' => 'suggestions#new_fave'
  post '/suggestions/:user_id/favorites/new' => 'suggestions#create_fave'
  delete '/suggestions/:user_id/favorites/:fave_id' => 'suggestions#destroy_fave'


#   root GET    /                                                  suggestions#index
#          search POST   /suggestions(.:format)                             suggestions#index
#           login GET    /login(.:format)                                   sessions#new
#                 GET    /auth/:provider/callback(.:format)                 sessions#create
# suggestions_new GET    /suggestions/new(.:format)                         suggestions#new
#                 POST   /suggestions/new(.:format)                         suggestions#create
#          logout DELETE /logout(.:format)                                  sessions#destroy
#                 GET    /users/:user_id/favorites(.:format)                users#favorites
#                 GET    /suggestions/:user_id/favorites/new(.:format)      suggestions#new_fave
#                 POST   /suggestions/:user_id/favorites/new(.:format)      suggestions#create_fave
#                 DELETE /suggestions/:user_id/favorites/:fave_id(.:format) suggestions#destroy_fave



end
