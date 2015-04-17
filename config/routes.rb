Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'

  root 'welcome#index'

  resources :users, only: :create
  get 'sign_up' => 'users#new', as: :sign_up

  resources :sessions, only: :create
  delete 'logout' => 'sessions#destroy', as: :logout
  get 'login' => 'sessions#new', as: :login

  resources :notes, except: :edit

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :notes
    end
  end
end
