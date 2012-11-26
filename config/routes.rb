Final::Application.routes.draw do
  resources :athletes

  get "static_pages/home"

  devise_for :users

  resources :espn, :only => :index

  root :to => 'static_pages#home'
end
