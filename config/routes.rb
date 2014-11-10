Rails.application.routes.draw do
  
  #User routes, users can be created edited or removed
  get     'users/',           to: 'users#index',   as: :users
  get     'users/new',        to: 'users#new',     as: :new_user
  post    'users/',           to: 'users#create'    
  get     'users/:id/edit',   to: 'users#edit',    as: :edit_user
  patch   'users/:id',        to: 'users#update'
  delete  'users/:id',        to: 'users#destroy'
    
  #Session routes, a session may be started or ended for a single user
  get     'sessions/new', to: 'sessions#new',     as: :new_session
  post    'sessions/',    to: 'sessions#create'
  delete  'sessions',     to: 'sessions#destroy', as: :session
  
  #First story text routes, users that are signed in can add to the story
  get     'first_story_texts/',         to: 'first_story_texts#index',as: :first_story_texts
  post    'first_story_texts/',         to: 'first_story_texts#create'
  patch   'first_story_texts/:id',      to: 'first_story_texts#update'
  delete  'first_story_texts/',         to: 'first_story_texts#destroy'    
  
  #Second story text routes, users that are signed in can add to the story
  get     'second_story_texts/',         to: 'second_story_texts#index',as: :second_story_texts
  post    'second_story_texts/',         to: 'second_story_texts#create'
  patch   'second_story_texts/:id',      to: 'second_story_texts#update'
  delete  'second_story_texts/',         to: 'second_story_texts#destroy'    
  
  #Third Story text routes, users that are signed in can add to the story
  get     'third_story_texts/',         to: 'third_story_texts#index',as: :third_story_texts
  post    'third_story_texts/',         to: 'third_story_texts#create'
  patch   'third_story_texts/:id',      to: 'third_story_texts#update'
  delete  'third_story_texts/',         to: 'third_story_texts#destroy' 
  
  #Fourth Story text routes, users that are signed in can add to the story
  get     'fourth_story_texts/',         to: 'fourth_story_texts#index',as: :fourth_story_texts
  post    'fourth_story_texts/',         to: 'fourth_story_texts#create'
  patch   'fourth_story_texts/:id',      to: 'fourth_story_texts#update'
  delete  'fourth_story_texts/',         to: 'fourth_story_texts#destroy'    
  
  #Fifth story text routes, users that are signed in can add to the story
  get     'fifth_story_texts/',         to: 'fifth_story_texts#index',as: :fifth_story_texts
  post    'fifth_story_texts/',         to: 'fifth_story_texts#create'
  patch   'fifth_story_texts/:id',      to: 'fifth_story_texts#update'
  delete  'fifth_story_texts/',         to: 'fifth_story_texts#destroy'   
    
  #The site begans on this page
  root ['first', 'second', 'third', 'fourth', 'fifth'].shuffle.first+'_story_texts#index'

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
