Rails.application.routes.draw do
  root :to => "pet_groups#index"
  resources :breeds, only: [:index, :show]
  resources :pet_groups, only: [:index, :show]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
