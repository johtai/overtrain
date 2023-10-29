Rails.application.routes.draw do
  post  "/get_username", to: "home#show"
  get   "/get_username", to: "home#show"

  get "/error", to: "home#error"
  root "home#index"
  #rails routes -g session
  resources :users, only: %i[new create]
  resource :session, only: %i[new create destroy]
  get '/show_all', to: 'home#show_all'

end
