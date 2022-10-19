Rails.application.routes.draw do

  #ユーザー用
  scope module: 'public' do
    devise_for :users, skip: [:password], controllers: {
      registrations: "public/registrations",
      sessions: 'public/sessions'
    }

    root to: "homes#top"
    get "/about" => "homes#about"

    resources :spots, only: [:index, :show]
    resources :users, only: [:show, :edit, :update] do
      member do
        get :favorites
      end
    end
    resources :post_spots, only: [:new, :show, :edit, :update, :destroy, :create]  do
      resource :favorites, only: [:create, :destroy]
      resource :post_comments, only: [:create]
      collection do
        get 'search'
      end
    end
    resources :prefectures, only: [:show]
  end

  #管理者用
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get "/" => "homes#top"

    resources :genres, only: [:index, :create, :destroy]
    resources :spots, only: [:index, :show, :edit, :destroy, :update]
    resources :users, only: [:index, :show, :edit, :update]
    resources :post_spots, only: [:show, :edit, :update, :destroy]
    resources :post_comments, only: [:destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
