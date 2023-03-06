Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "products#index"
  get "preview/:id" => "business/customers#preview", as: 'preview'
  delete "delete_customer/:id" => "business/customers#delete_customer", as: 'delete_customer'
  resources :products do
    resources :orders
  end
  namespace :business do
    resources :customers, except: [:show, :destroy]
  end
  namespace :api do
    namespace :v1 do
      resource :verifications, only: :show, controller: 'app/api/v1/verifications'
    end
  end
end
