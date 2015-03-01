Rails.application.routes.draw do
  devise_for :users, :path => 'accounts'

  resources :media_items, :only => [:index, :new, :create, :destroy]

  root :to => 'media_items#index'
end
