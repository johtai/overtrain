require 'net/http'
class HomeController < ApplicationController
  def index
  end
  def error
  end

  def show
    username = helpers.get_username(params[:username])

    if !username.nil? & !username['error']

      return @response = username
    end


    if username['error'] & username.blank?
      if helpers.get_all_usernames(params[:username])["total"] == 0
        redirect_to error_path
      end


      if helpers.get_all_usernames(params[:username])["total"] == 1
        rsp = helpers.get_all_usernames(params[:username])
        username = rsp['results'][0]['player_id']
        return @response = helpers.get_username(username)

      end

    end


    if(helpers.get_all_usernames(params[:username])["total"] > 1)

      redirect_to show_all_path(username: params[:username])
    end


    #@response = helpers.get_username(username)
  end



  def show_all
    usernames = helpers.get_all_usernames(params[:username])
    uname = params[:username]

    @response = usernames
  end
end