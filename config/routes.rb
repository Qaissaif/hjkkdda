Hadhada::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root  :to=>'main#index'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  # Example resource route with options:

    resources :article,:except=>[:show] do
       collection do
         get :new_article
         post :create_article
         get :add_icon
         post :icon
       end
    end

    resources :comment do
      collection do
        post :create_comment
      end
    end

    resources :dashboard do
       collection do
         get :add_user
         post :create_user
       end
    end

    resources :main do
       collection do
         get :sign
         post :sign_in
         get :signup
         post :sign_up
         get :sign_out
         post :check_email
         post :check_username
       end
    end

    resources :category do
       collection do
       end
    end

    resources :sound do
       collection do
        get :sounds
       end
    end

    resources :quote do
       collection do
       end
    end

    resources :planer do
      collection do
      end
    end

  match '/planer/download/:filename', :action => 'download', :via => [:get], :controller => 'planer'
  match '/:category/:article/:id', :action => 'show', :via => [:get], :controller => 'article'

  match '*a', :to => 'application#routing', via: :get
  get '/404', :to => 'application#routing', via: :get
  get '/500', :to => 'application#server', via: :get
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
