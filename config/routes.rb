Rails.application.routes.draw do
  match "/get_username" => "home#show_all", via: :get
  match "/show" => "home#show", via: :get
  match "/error" => "home#error", via: :get
  
  root "home#index"

  resources :users, only: %i[new create]
  resource :session, only: %i[new create destroy]

end
