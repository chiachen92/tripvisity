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

  resources :budgets do
    resources :status, only: [:create] do
      patch :update, on: :collection
    end
  end

  resources :users

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

end
