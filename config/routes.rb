Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/sign_in', to: "users/sessions#sign_in"
  post '/sign_up', to: "users/registrations#create"
end
