Rails.application.routes.draw do
  get "/search" => "home#search"
  get "/username/:username" => "home#show"
  get "/error" => "home#error"

  # TODO
  # get /user/:user_id
  # get /user/:user_id/edit
  # post /user/:user_id/edit
  # patch /user/:user_id/edit
  # get /user/:user_id/subscriptions
  # delete /user/:user_id/subscriptions
  # post /user/:used_id/subscriptions

  get "/wiki" => "wiki#index"
  get "/wiki/heroes" => "wiki#show_heroes"
  get "/wiki/heroes/:id" => "wiki#show_hero"
  get "/wiki/gamemodes" => "wiki#show_gamemodes"
  get "/wiki/gamemodes/:id" => "wiki#show_gamemode"
  get "/wiki/maps" => "wiki#show_maps"
  get "/wiki/maps/:id" => "wiki#show_map"

  root "home#index"

  resources :users, only: %i[new create]
  resource :session, only: %i[new create destroy]

end
