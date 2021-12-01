Rails.application.routes.draw do
  get 'breeds/index'
  get 'breeds/show'
  get 'pet_groups/index'
  get 'pet_groups/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
