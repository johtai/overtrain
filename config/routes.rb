Rails.application.routes.draw do
  get "/search" => "home#search"
  get "/username/:username" => "home#show"
  get "/error" => "home#error"

  # TODO
  # get /profile/:user_id
  # get /profile/:user_id/edit
  # post /profile/:user_id/edit
  # patch /profile/:user_id/edit
  # get /profile/:user_id/subscriptions
  # delete /profile/:user_id/subscriptions
  # post /profile/:used_id/subscriptions
  #
  # get "/wiki"
  # get "/wiki/heroes"
  # get "/wiki/heroes/:id"
  # get "/wiki/gamemodes"
  # get "/wiki/gamemodes/:id"
  # get "/wiki/maps"
  # get "/wiki/maps/:id"

  root "home#index"

  resources :users, only: %i[new create]
  resource :session, only: %i[new create destroy]

end
