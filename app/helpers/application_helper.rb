require 'uri'
require 'net/http'
require 'json'

module ApplicationHelper
  def get_all_usernames(username)
    uri = URI("https://overfast-api.tekrop.fr/players?name=#{username}")
    unparsed_response = Net::HTTP.get_response(uri)
    JSON.parse(unparsed_response.body)
  end
  def get_username_stats(username)
    uri = URI("https://overfast-api.tekrop.fr/players/#{username}/stats/summary")
    unparsed_response = Net::HTTP.get_response(uri)
    JSON.parse(unparsed_response.body)
  end
  def get_hours (time)
    if (time < 180000)
      return (time / 3600.0).round(1)
    else
      return (time / 3600)
    end
  end
  def get_username_summary(username)
    uri = URI("https://overfast-api.tekrop.fr/players/#{username}/summary")
    unparsed_response = Net::HTTP.get_response(uri)
    result = JSON.parse(unparsed_response.body)
    result["username"] = username

    result
  end
  def create_maps_db
    uri = URI("https://overfast-api.tekrop.fr/maps")
    unparsed_response = Net::HTTP.get_response(uri)
    maps = JSON.parse(unparsed_response.body)

    maps.each do |map|
      new_map = Map.create(name: map["name"], screenshot: map["screenshot"], gamemodes: map["gamemodes"],
                           location: map["location"], country_code: map["country_code"])
      new_map.save()
    end
  end
  def create_gm_db
    uri = URI("https://overfast-api.tekrop.fr/gamemodes")
    unparsed_response = Net::HTTP.get_response(uri)
    gms = JSON.parse(unparsed_response.body)

    gms.each do |gm|
      new_gm = Gamemode.create(key: gm["key"], name: gm["name"], icon: gm["icon"],
                               desc: gm["description"], screenshot: gm["screenshot"])
      new_gm.save()
    end
  end
  def create_heroes_db
    uri = URI("https://overfast-api.tekrop.fr/heroes")
    unparsed_response = Net::HTTP.get_response(uri)
    heroes = JSON.parse(unparsed_response.body)

    heroes.each do |hero|
      uri = URI("https://overfast-api.tekrop.fr/heroes/#{hero["key"]}")
      unparsed_response = Net::HTTP.get_response(uri)
      attributes = JSON.parse(unparsed_response.body)

      new_hero = Hero.create(hero_id: hero["key"], name: attributes["name"], desc: attributes["description"],
                               portrait: attributes["portrait"], role: attributes["role"],
                               location: attributes["location"], hitpoints: attributes["hitpoints"],
                               abilities: attributes["abilities"], story: attributes["story"])
      new_hero.save()
    end
  end
  def update_player_stats(player_summary, player_stats)
    player = Player.where(:player_id => player_summary["username"])

    if !player.present?
      Player.create(:player_id => player_summary["username"], :dump_date => DateTime.now,
                    :kda => player_stats['general']["kda"], :winrate => player_stats['general']["winrate"],
                    :avg_elim => player_stats['general']['average']['eliminations'],
                    :avg_ass => player_stats['general']['average']['assists'],
                    :avg_dam => player_stats['general']['average']['damage'],
                    :avg_death => player_stats['general']['average']['deaths'],
                    :avg_heal => player_stats['general']['average']['healing'])
    else
      #player.update()
    end
  end
end
