Rails.application.routes.draw do
  resources :comments
  root 'posts#index'

  resources :posts do
    resources :comments
    end
end


