Rails.application.routes.draw do
  resources :domain_purchases do
    collection do
      get :query_poll, :purchase_privacy, :info_query, :check_domain, :register_domain, :confirm_purchase, :buy_domain, :thanks, :sorry
      post :do_check_domain, :do_register_domain, :paypal
    end

  end

  #get '/' => 'domain_purchases#check_domain'
  get '/get_price_domain' => 'domain_purchases#get_price'
  get '/get_state' => 'domain_purchases#get_state'

  resources :subscriptions
  #root 'subscriptions#index'
  root 'domain_purchases#check_domain'


  #get 'paypal/show' => 'subscriptions#show'


  get 'paypal/checkout_express' => 'subscriptions#paypal_checkout_express'
  get 'paypal/express' => 'subscriptions#paypal_express'
  get 'paypal/checkout_recurring' => 'subscriptions#paypal_checkout_recurring'
  get 'paypal/recurring' => 'subscriptions#paypal_recurring'
  post 'paypal/ipn' => 'subscriptions#notification'

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
