GigaBlab::Application.routes.draw do
  root :to => "home#index"

  devise_for :users
  match 'users/:id' => 'users#show'

  resources :topics do
    resources :posts, :only => [:create, :destroy]
  end
end
