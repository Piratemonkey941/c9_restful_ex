Rails.application.routes.draw do
  resources :comments
  root 'posts#index'

  resources :posts do
    resources :comments
    get :search, on: :collection
    end

   
end


