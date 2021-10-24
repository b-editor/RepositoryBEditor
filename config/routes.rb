Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # if you want to use restful routing, use this!
  resources :users
  resources :auth, :only => [ :create, :update,:destroy ]
  resources :packages do
    resources :versions
  end
  post 'upload', to:'packages#uploading'
  post 'signin', to: 'auth#create'
  post 'signup', to: 'users#create'
  get 'getAccountInfo', to: 'users#me'
  post 'update', to: 'users#updateme'
  post 'deleteAccount', to: 'users#deleteme'
end
