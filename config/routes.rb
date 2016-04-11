Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }, :path => 'accounts'

  # GG: I had to edit the devise path for facebook.
  # Old path is below
  # devise_for :users, :path => 'accounts'
  resources :users do
    resources :profiles, only: [:index, :edit, :update, :destroy]
    resources :loans, only: :index
  end

  get 'books/borrow' => 'books#borrow', as: :books_borrow
  get 'books/search' => 'books#search', as: :books_search
  get 'books/sharebook' => 'books#sharebook', as: :books_sharebook
  get 'books/googleresults' => 'books#googleresults', as: :books_googleresults



  resources :books do
    resources :loans, only: [:create], shallow: true
  end

  patch 'loans/:id/approve' => 'loans#approve_loan', as: :approve_loan
  patch 'loans/:id/reject' => 'loans#reject_loan', as: :reject_loan
  patch 'loans/:id/close_pending' => 'loans#close_pending', as: :close_pending


  get 'users/:user_id/library'  => 'loans#library', as: :library

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
