Final::Application.routes.draw do
  resources :athletes

  devise_for :users

  root :to => 'static_pages#home'
end
