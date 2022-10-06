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
    resources :users, only: [:show, :edit, :update]
    get '/users/:id/detail' => 'users#detail'
    resources :post_spots, only: [:new, :show, :edit, :update, :destroy, :create]  do
      resource :favorites, only: [:create, :destroy]
    end
    resources :prefectures, only: [:show]
    resources :genres, only: [:show]
  end

  #管理者用
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get "/" => "homes#top"

    resources :genres, only: [:index, :edit, :create, :destroy, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
