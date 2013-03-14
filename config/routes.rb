GigaBlab::Application.routes.draw do
  ActiveAdmin.routes(self)

  root :to => "home#index"

  devise_for :users
  match '/users/:id', :to => 'users#show', :as => :user

  resources :topics do
    member do
      match :flag
      match :unflag
    end
    resources :posts, :only => [:show, :create, :edit, :update, :destroy, :flag, :unflag] do
      member do
        match :flag
        match :unflag
      end
    end
  end
end
