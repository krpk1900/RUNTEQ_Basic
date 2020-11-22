Rails.application.routes.draw do
  root to: 'static_pages#top'
  resources :users, only: %i[new create]
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  resources :boards do
    resources :comments, only: %i[create destroy update], shallow: true
    resource :bookmarks, only: %i[create destroy], shallow: true
    collection do
      get 'bookmarks'
    end
  end
  resources :bookmarks, only: %i[create destroy]
  resource :profile, only: %i[show edit update]
  resources :password_resets, only: %i[new create edit update]

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

end
