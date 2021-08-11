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
  end

  # 利用者側
  # devise_for :users
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :user do
    resources :animes
    resources :comments
    resources :favorites
    resources :voices
    resources :messages
  end
end
