module ApplicationHelper


  def get_username(user)
    require 'uri'
    require 'net/http'

    uri = URI("https://overfast-api.tekrop.fr/players/#{user}/stats/summary")
    res = Net::HTTP.get_response(uri)

    puts res.body

    @response = res.body
    #https://overfast-api.tekrop.fr/players/johtai-2598/stats/summary
    #redirect_to root_path
  end



end
