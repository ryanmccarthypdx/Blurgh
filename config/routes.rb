Rails.application.routes.draw do
  root :to => 'posts#index'

  resources :users

  resources :posts do
    resources :comments, :except => [:index, :show]
  end

end
