module ApplicationHelper


  def get_username
    require 'uri'
    require 'net/http'

    uri = URI('https://overfast-api.tekrop.fr/players/johtai-2598/stats/summary')
    res = Net::HTTP.get_response(uri)

    puts res.body

    @response = res.body

    #redirect_to root_path
  end



end
