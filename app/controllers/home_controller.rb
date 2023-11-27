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
  def subscribe
    user_id = session[:user_id]
    player_stats = params[:player_stats]
    player_id = player_stats["player_id"]

    subs = Subscription.where(:user_id => user_id, :player_id => player_id)
    player = Player.where(:player_id => player_id)

    redirect_to error_path if subs.present? or player.present?

    #Player.create(:kda => player_stats["kda"], :winrate => player_stats["winrate"],
    #              :avg_elim => player_stats['average']['eliminations'],
    #              :avg_ass => player_stats['average']['assists'],
    #              :avg_dam => player_stats['average']['damage'],
    #              :avg_death => player_stats['average']['deaths'],
    #              :avg_heal => player_stats['average']['healing'])
    #Subscription.create({ :user_id => user_id, :player_id => player_id })
  end
end