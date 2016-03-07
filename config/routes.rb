Rails.application.routes.draw do
  #root to: 'visitors#index'
  devise_for :users
  resources :users

  root to: "home#index"
  #devise_for :users
  resources :searches
  resources :bibliotecas
  resources :refused_transfers
  resources :performed_transfers
  resources :transfers
  
  get 'searches/:id/edit', to: 'searches#edit', id: /[^\/]+/
  get 'searches/:id/edit', to: 'searches#edit', id: /\d{5}\.\d{3}\.\d\w/ 
  match '/searches/search' => 'searches#search', via: 'post'
  match '/searches/create' => 'searches#create', via: 'post'
  match '/searches/show' => 'searches#show', via: 'post'
  match '/searches/update2' => 'searches#update2', via: 'post'
  match '/transfers/teste' => 'transfers#teste', via: 'post'
  LOCALES = /en|pt\-BR/
    scope ":locale", locale: /en|pt\-BR/ do
      resources :users
      resources :searches
      resources :bibliotecas
      resources :refused_transfers
      resources :performed_transfers
      resources :transfers
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
