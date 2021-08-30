Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root    'static#about', as: 'about'

  get 'auth/google_oauth2/callback', to: 'sessions#omniauth'
  
  get     'signup',       to: 'users#new'
  post    'signup',       to: 'users#create'
  get     'login',        to: 'sessions#new'
  post    'login',        to: 'sessions#create'
  delete  'logout',       to: 'sessions#destroy'
  

  resources :users do
    get 'favorites',   to: 'books#index'
    get 'finished',    to: 'books#index'
    get 'reading_now', to: 'books#index'
    get 'bucket_list', to: 'books#index'
  end
  
  resources :books, only: [:show, :index] do
    resources :opinions, only: [:create, :edit, :update, :destroy]
    post 'favorites',   to: 'favorite_books#create'
    post 'finished',    to: 'finished_books#create'
    post 'reading_now', to: 'reading_now_books#create'
    post 'bucket_list', to: 'bucket_list_books#create'
  end

  resources :authors, only: [:show]

end
