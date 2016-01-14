Rails.application.routes.draw do
    root 'main#index'
    get '/welcome' => 'welcome#index'

    get '/login' => 'users#old'
    post '/login' => 'users#login'
    get '/logout' => 'users#logout'

    get '/dashboard' => 'users#show'
    get '/create-account' => 'users#new'
    post '/users' => 'users#create'
    get '/update-account' => 'users#edit'
    patch '/users/:id' => 'users#update'
    delete '/users/:id' => 'users#destroy'
    get '/job-details/:id' => 'users#show_job'

    get '/add-job' => 'jobs#new'
    post '/jobs' => 'jobs#create'
    get '/jobs/:id/edit' => 'jobs#edit'
    patch '/jobs/reject/:id' => 'jobs#update_reject'
    patch '/jobs/research/:id' => 'jobs#update_research'
    patch '/jobs/progress/:id' => 'jobs#update_progress'
    patch '/jobs/information/:id' => 'jobs#update_info'
    patch '/jobs/offer/:id' => 'jobs#update_offer'
    delete '/jobs/:id' => 'jobs#destroy'

    get '/dashboard/cover_letter' => 'main#cover_letter'
    get '/dashboard/compare_salaries' => 'main#salaries'
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
