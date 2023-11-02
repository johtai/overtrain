require 'net/http'
class HomeController < ApplicationController
  def index
  end
  def error
  end

  def show_all
    username_response = helpers.get_all_usernames(params[:username])
    redirect_to show_path(username: params[:username]) if [0, 1].include? username_response["total"]

    @response = username_response
  end

  def show
    username_response = helpers.get_username(params[:username])
    redirect_to error_path if username_response['error'] == 'Player not found'

    @response = username_response
  end
end