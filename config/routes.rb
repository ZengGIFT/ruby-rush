Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    member do
      post :upvote
    end
  end

  resources :leaderboard do
    member do
      post :upvote
    end
  end

  resources :yourboard do
    member do
      post :upvote
    end
  end



  resources :digruby do
      post :start_digging
      post :dig_again
      post :get_nine_new_minerals
      resources :minerals do
        member do
          post :select_mineral
        end
      end
  end


  resources :ptasks




  resources :about




  namespace :admin do
    resources :users do
      member do
        post :active
        post :dis_active
        post :set_admin
      end
    end
    resources :ptasks do
      member do
        post :hide
        post :publish
      end
    end
  end

  root 'posts#index'
end
