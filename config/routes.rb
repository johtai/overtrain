Rails.application.routes.draw do
  get "/search" => "home#search"
  get "/username/:username" => "home#show"
  get "/error" => "home#error"
  
  root "home#index"

  resources :users, only: %i[new create]
  resource :session, only: %i[new create destroy]

end
