Rails.application.routes.draw do
  root :to => 'sessions#new'

  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out

  resources :users

  resources :posts do
    resources :comments, :except => [:index, :show]
  end

end
