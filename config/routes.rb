Rails.application.routes.draw do

  get "/get_username", to: "home#get_username"
  root "home#index"
  #rails routes -g session
  resources :users, only: %i[new create]
  resource :session, only: %i[new create destroy]
end
