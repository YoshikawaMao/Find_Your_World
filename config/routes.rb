Rails.application.routes.draw do
  root to: 'homes#top'
  get "top" => "homes#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # 管理者側
  # devise_for :admins
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations',
  }

  namespace :admin do
    resources :animes, only: [:index, :show, :edit, :update, :destroy] do
      resources :comments, only: [:destroy]
    end
    resources :voices, only: [:index, :show, :create, :edit, :update, :destroy] do
      collection do
        get 'search'
      end
    end
    resources :messages, only: [:index, :create, :destroy]
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :anime_urls, only: [:index, :create, :destroy]
  end

  # get 'admins/animes/:genre_id' => 'admin/animes#index', as: :admin_animes_genre

  # 利用者側
  # devise_for :users
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  namespace :user do
    resources :voices, only: [:index, :show, :create, :destroy] do
      collection do
        get 'search'
      end
    end
    resources :messages, only: [:index, :create, :destroy]
    resources :animes, only: [:index, :show, :create] do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
    get '/search', to: 'searches#search'
    # resources :genres
  end
end
