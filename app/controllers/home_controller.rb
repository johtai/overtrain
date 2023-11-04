require 'net/http'
class HomeController < ApplicationController
  def index
  end
  def error
  end

  def show_all
    username_response = helpers.get_all_usernames(params[:username])

    if username_response["total"] > 1
      @response = username_response
    else
      usr = username_response["total"] == 1 ? username_response["results"][0]["player_id"] : params[:username]
      redirect_to show_path(username: usr)
    end
  end

  def show
    username_response = helpers.get_username(params[:username])
    redirect_to error_path if username_response['error'] == 'Player not found'

    @response = username_response
  end
end