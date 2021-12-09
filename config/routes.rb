Rails.application.routes.draw do
  devise_for :customers
  get 'pages/:permalink' => 'pages#permalink' , as: 'permalink' #using it in ruby: permalink_path
  root :to => "pet_groups#index"
  resources :breeds, only: [:index, :show] do
    collection do
      get "search"
    end
  end
  resources :pet_groups, only: [:index, :show]
  resources :cart, only: [:create, :destroy]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # Stripe routing
  scope "/checkout" do
    post "create", to: "checkout#create", as: "checkout_create"
    get "success", to: "checkout#success", as: "checkout_success"
    get "cancel", to: "checkout#cancel", as: "checkout_cancel"
  end
end
