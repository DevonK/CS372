GigaBlab::Application.routes.draw do
  root :to => "home#index"

  devise_for :users

  resources :topics do
    resources :posts, :only => [:create, :destroy]
  end
end
