Rails.application.routes.draw do
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
end
