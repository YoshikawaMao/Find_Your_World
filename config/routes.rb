Rails.application.routes.draw do

 root to: 'homes#top'
 get "top" => "homes#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # 管理者側
  # devise_for :admins
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  }

  namespace :admin do
    resources :animes
    resources :comments
    resources :voices
    resources :messages
    resources :genres
    # resources :anime_urls
  end

  # get 'admins/animes/:genre_id' => 'admin/animes#index', as: :admin_animes_genre

  # 利用者側
  # devise_for :users
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :user do
    resources :voices
    resources :messages
    resources :genres
    resources :animes do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
    get '/search', to: 'searches#search'
  end
end
