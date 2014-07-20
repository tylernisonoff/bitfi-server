BitfiServer::Application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }

  root to: 'home#index'
  get '/accept' => 'home#accept'
  get '/login' => 'home#log_in'

  match '*path' => redirect('/')

  resources :users, only: :none do
    resources :connections, only: [:create, :index]
  end

  resources :connections, only: :none do
    post :activate, on: :member
  end
end
