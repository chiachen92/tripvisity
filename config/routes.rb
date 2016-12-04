Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#homepage'
  get '/about' => 'home#about'

  resources :trips
  resources :users
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
  
end
