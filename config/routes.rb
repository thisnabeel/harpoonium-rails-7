Rails.application.routes.draw do
  devise_for :users, controllers: { 
    sessions: 'users/sessions'
  }

  resources :chapters, only: [:show] do
    get 'sample', on: :collection
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # devise_for :users
  # devise_for :users
  # post "/users/sign_up" => "users/sessions#sign_up"
  # post "/users/sign_in" => "users/sessions#create"
  # get "/users/sign_out" => "users/sessions#destroy"
    # Defines the root path route ("/")
  get 'signin_form', to: 'auth#signin_form', as: :signin_form
  get 'signup_form', to: 'auth#signup_form', as: :signup_form

    get "/sign_up" => "creds#sign_up"
    get "/sign_in" => "creds#sign_in"


  root "pages#home"
end
