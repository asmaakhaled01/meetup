Rails.application.routes.draw do

  get 'sessions/new'

  resources :groups do
    resources :interests end

  #resources :members
  #resources :attendens
  #resources :interests
  #resources :photos

  resources :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'groups#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
   get 'signup' => 'users#new' #, as: :purchase

    #get 'login' => 'users#getlogin'
    # post 'login' => 'users#login'


    get 'start_group' => 'groups#new'
    post 'start_group' => 'groups#create'

    get 'start_event' => 'events#new'
    post 'start_event' => 'events#create'

    post 'join' => 'groups#join'
    post 'attend' => 'events#attend'

    get 'calender' =>'events#calender'
    get 'mycalender' =>'users#calender'

    post 'find' =>'events#find'

    get    'login'   => 'sessions#new'
    post   'login'   => 'sessions#create'
    delete 'logout'  => 'sessions#destroy'

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
