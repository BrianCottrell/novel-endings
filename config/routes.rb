Rails.application.routes.draw do
  
  #User routes, users can be created edited or removed
  get     'users/',           to: 'users#index',   as: :users
  get     'users/new',        to: 'users#new',     as: :new_user
  get     'users/:id',        to: 'users#show',    as: :user
  post    'users/',           to: 'users#create'    
  get     'users/:id/edit',   to: 'users#edit',    as: :edit_user
  patch   'users/:id',        to: 'users#update'
  delete  'users/:id',        to: 'users#destroy'
    
  #Session routes, a session may be started or ended for a single user
  get     'sessions/new', to: 'sessions#new',     as: :new_session
  post    'sessions/',    to: 'sessions#create'
  delete  'sessions',     to: 'sessions#destroy', as: :session
    
  #Story text routes, users that are signed in can add to the story
  get     'story_texts/',         to: 'story_texts#index',as: :story_texts
  post    'story_texts/',         to: 'story_texts#create'
  get     'story_texts/new',      to: 'story_texts#new',  as: :new_story_text
  get     'story_texts/:id',      to: 'story_texts#show', as: :story_text 
  get     'story_texts/:id/edit', to: 'story_texts#edit', as: :edit_story_text
  patch   'story_texts/:id',      to: 'story_texts#update'
  delete  'story_texts/',         to: 'story_texts#destroy'    
    
  #The site begans on this page
  root 'story_texts#index'

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
