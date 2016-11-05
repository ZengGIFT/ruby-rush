Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    member do
      post :upvote
    end
  end

  resources :digruby

  namespace :admin do
    resources :users do
      member do
        post :active
        post :dis_active
        post :set_admin
      end
    end
  end

  root 'posts#index'
end
