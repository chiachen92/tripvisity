Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#homepage'
  get '/about' => 'home#about'

  get '/home', to: 'trips#search_trip', as: :search_trip

  resources :trips do
    resources :pictures
    resources :comments do
      resources :votes, shallow: true
    end
  end

  resources :users
  resources :budgets do
    resources :status, only: [:create] do
      patch :update, on: :collection
    end
  end

  resources :charges

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

end
