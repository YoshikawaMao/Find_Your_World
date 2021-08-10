Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homes#top'
  get "top" => "homes#top"

  namespace :admin do
    resources :animes
    resources :comments
    resources :voices
    resources :messages
    resources :genres
  end

  namespace :user do
    resources :animes
    resources :comments
    resources :favorites
    resources :voices
    resources :messages
  end


end
