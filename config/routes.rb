Rails.application.routes.draw do

  root to: "welcome#index"

  get 'admin/main'
  get 'admin/best_rated'
  get 'admin/flagged_comments'
  get 'admin/flagged_prints'
  get 'admin/out_of_stock'
  get 'admin/most_pledges'

  get 'pledge/thank_you'

  resources :order_items, only: [:create, :update, :destroy]

  get 'order_items/create'
  get 'order_items/update'
  get 'order_items/destroy'

  resource :cart, only: [:show]
  get 'carts/show'
  
  
  resources :products do
    resources :subproducts
  end

  devise_for :users
  resources :users 
  

  resources :prints do
    member do
      put 'flag', 'turn_into_product'
    end
    resources :pledges, except: :show
    resources :reviews, except: :show do
      member do
        put 'flag'
      end
    end
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
end
