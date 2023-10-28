module ApplicationHelper
  def get_username(username)
    require 'uri'
    require 'net/http'
    require 'json'

    uri = URI("https://overfast-api.tekrop.fr/players/#{username}/stats/summary")
    response = Net::HTTP.get_response(uri)

    re = response.body
    jp =JSON.parse(re)

    @response = jp
  end

  #https://overfast-api.tekrop.fr/players/johtai-2598/stats/summary

end
