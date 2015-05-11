Rails.application.routes.draw do
  
  resources :groups do
  resources :interests 
end

  #resources :members
  #resources :attendens
  #resources :interests
  #resources :photos

  resources :users


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'groups#index'

  # Example of named route that can be invoked with purchase_url(id: product.id)
     get 'signup' => 'users#new' #, as: :purchase
     
     get 'login' => 'sessions#new' 
     post 'login' => 'sessions#create' 
     delete 'logout' => 'sessions#destroy'


     get 'start_group' => 'groups#new'
     post 'start_group' => 'groups#create'

     get 'start_event' => 'events#new'
     post 'start_event' => 'events#create'

     get 'join' => 'groups#join'
     get 'attend' => 'events#attend'

     get 'calender' =>'events#calender'
     
     get 'mycalender' =>'users#calender'
     get 'search' => 'users#search'

     post 'find' =>'groups#find'
  

  resources :events do
  resources :comments end
     




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
