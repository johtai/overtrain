module ApplicationHelper


  def get_username(user)
    require 'uri'
    require 'net/http'
    require 'json'

    uri = URI("https://overfast-api.tekrop.fr/players/#{user}/stats/summary")
    response = Net::HTTP.get_response(uri)

    re = response.body
    jp =JSON.parse(re)

    @response = jp


    #https://overfast-api.tekrop.fr/players/johtai-2598/stats/summary
    #redirect_to root_path
  end



end
