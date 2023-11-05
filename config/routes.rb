Rails.application.routes.draw do
  match "/search" => "home#search", via: :get
  match "/username/:username" => "home#show", via: :get
  match "/error" => "home#error", via: :get
  
  root "home#index"

  resources :users, only: %i[new create]
  resource :session, only: %i[new create destroy]

end
