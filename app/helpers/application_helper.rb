require 'uri'
require 'net/http'
require 'json'

module ApplicationHelper
  def get_username(username)
    uri = URI("https://overfast-api.tekrop.fr/players/#{username}/stats/summary")
    unparsed_response = Net::HTTP.get_response(uri)

    JSON.parse(unparsed_response.body)
  end

  def get_all_usernames(username)
    uri = URI("https://overfast-api.tekrop.fr/players?name=#{username}")
    unparsed_response = Net::HTTP.get_response(uri)
    
    JSON.parse(unparsed_response.body)
  end
end
