Rails.application.routes.draw do
  root to: 'static_pages#top'
  resources :users, only: %i[new create]
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  resources :boards, shallow: true, only: %i[new create show index] do
    resources :comments
  end
end
