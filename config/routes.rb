GigaBlab::Application.routes.draw do
  root :to => "home#index"

  devise_for :users
  match '/users/:id', :to => 'users#show', :as => :user

  resources :topics do
    resources :posts, :only => [:show, :create, :edit, :update, :destroy]
  end
end
