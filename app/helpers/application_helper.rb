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
  def get_username_summary(username)
    uri = URI("https://overfast-api.tekrop.fr/players/#{username}/summary")
    unparsed_response = Net::HTTP.get_response(uri)
    JSON.parse(unparsed_response.body)
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
end
