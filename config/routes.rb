Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :sessions, only: [:create]
  resource :users, only: [:update]
  resources :registrations, only: [:create] do
    collection do
      post :check_email
    end
  end

  resources :property_categories, only: [:index]
  resources :properties, only: [:index, :show, :create, :update, :destroy]

  # Add the confirmation route
  post 'confirm_email/:token', to: 'confirmations#confirm_email'

  #get 'confirm_email/:token', to: 'confirmations#confirm_email', as: 'confirm_email'

  get '/authenticated', to: 'sessions#check_authentication'
  
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
  root to: "static#home"
end
