Rails.application.routes.draw do
  root 'posts#index'
  resources :users
  delete 'users/logout' => 'users#destroy'

  resources :posts do
    resources :comments
  end
end
