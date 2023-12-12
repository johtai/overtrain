Rails.application.routes.draw do
  get "/search" => "home#search"
  get "/username/:username" => "home#show"
  get "/error" => "home#error"

  post "/subscribe" => "home#subscribe"

  get "/help" => "home#help"
  get "/about" => "home#about"
  delete "/session/delete" => "sessions#destroy"

  get "/wiki" => "wiki#index"
  get "/wiki/heroes" => "wiki#show_heroes"
  get "/wiki/heroes/:hero_id" => "wiki#show_hero"
  get "/wiki/gamemodes" => "wiki#show_gamemodes"
  get "/wiki/gamemodes/:id" => "wiki#show_gamemode"
  get "/wiki/maps" => "wiki#show_maps"
  get "/wiki/maps/:id" => "wiki#show_map"

  '''get "/user/:user_id"
  get "/user/:user_id/edit"
  post "/user/:user_id/edit"
  patch "/user/:user_id/edit"
  get "/user/:user_id/subscriptions"
  delete "/user/:user_id/subscriptions"
  post "/user/:used_id/subscriptions"'''

  root "home#index"

  resources :users, only: %i[new create]
  get "users/:user_id" => "users#show"
  resource :session, only: %i[new create destroy]

end
