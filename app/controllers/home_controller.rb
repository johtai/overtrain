require 'net/http'
class HomeController < ApplicationController
  def index
  end
  def error
  end
  def search
    usernames_response = helpers.get_all_usernames(params[:username])

    if usernames_response["total"] > 1
      @all_usernames = usernames_response
    else
      username = usernames_response["total"] == 1 ? usernames_response["results"][0]["player_id"] : params[:username]
      redirect_to "/username/#{username}"
    end
  end
  def show
    username_response = helpers.get_username_stats(params[:username])
    redirect_to error_path if username_response['error'] == 'Player not found'

    @username_summary = helpers.get_username_summary(params[:username])
    @username_stats = username_response
  end
end