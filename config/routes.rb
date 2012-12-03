Final::Application.routes.draw do
  resources :bugs

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :athletes

  devise_for :users

  root :to => 'static_pages#home'
end
