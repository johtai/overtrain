require 'net/http'
class HomeController < ApplicationController
  def index
  end
  def error
  end
  def show_all
    usernames = helpers.get_all_usernames(params[:username])

    if usernames["total"] == 1
      show
    end

    @response = usernames
  end
  def show
    username = helpers.get_username(params[:username])

    if username.nil?
      redirect_to "/error"
    end
    @response = username
  end
end