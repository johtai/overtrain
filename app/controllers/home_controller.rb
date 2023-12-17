require 'net/http'
class HomeController < ApplicationController
  def index
  end

  def error
  end

  # search for a specific player or all players knowing only a username
  def search
    usernames_response = helpers.get_all_usernames(params[:username])

    if usernames_response["total"] > 1
      @all_usernames = usernames_response
    else
      username = usernames_response["total"] == 1 ? usernames_response["results"][0]["player_id"] : params[:username]
      redirect_to "/username/#{username}"
    end
  end

  # render a player page if there is no error
  def show
    username_response = helpers.get_username_stats(params[:username])
    redirect_to error_path if username_response['error'] == 'Player not found'
    redirect_to "/", notice: 'Нет информации об этом игроке' if username_response.blank?
    @player_summary = helpers.get_username_summary(params[:username])
    @player_stats = username_response
  end

  # subscribe to a specific player's stats and create a records in Player and Subscription
  def subscribe
    user_id = session[:user_id]
    player_summary = params[:player_summary]
    player_stats = params[:player_stats]
    subs = Subscription.where(:user_id => user_id, :player_id => player_summary["username"])
    if !subs.present?
      Subscription.insert({ :user_id => user_id, :player_id => player_summary["username"] })
    else

    end

    helpers.update_player_stats(player_summary, player_stats)

    #redirect_to "/username:#{player_stats["player_id"]}"
  end

  def help

  end

  def about

  end
end