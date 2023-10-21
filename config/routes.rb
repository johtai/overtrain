Rails.application.routes.draw do

  post  "/get_username", to: "users#show"
  get   "/get_username", to: "users#show"
  root "home#index"
  #rails routes -g session
  resources :users, only: %i[new create]
  resource :session, only: %i[new create destroy]

end
