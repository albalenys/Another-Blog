Rails.application.routes.draw do
  root 'posts#index'
  resources :users

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  delete 'users/logout' => 'users#destroy'

  resources :posts do
    resources :comments
  end
end
