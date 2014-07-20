BitfiServer::Application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }

  root to: 'home#index'
  get '/accept' => 'home#accept'
  get '/login' => 'home#log_in'

  resources :users, only: :none do
    get :connected_devices, on: :member
    resources :connections, only: [:create, :index]
  end

  resources :connections, only: :none do
    post :activate, on: :member
  end

  match '*path' => redirect('http://54.210.58.4')
end
