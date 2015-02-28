Rails.application.routes.draw do
  devise_for :users, :path => 'accounts'

  resources :media_items, :only => :index

  root :to => 'application#index'
end
