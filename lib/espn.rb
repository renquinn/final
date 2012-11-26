class Espn
  include HTTParty
  base_uri 'api.espn.com'
  #http://api.espn.com/:version/:resource/:method?apikey=:yourkey

  def self.athletes(league="nfl")
    @key = "2n9w6hnjnjbeajwgd3bze9uz"
    @leagues = {:nfl => "sports/football/nfl",
      :cf => "sports/football/college-football",
      :mcb => "sports/basketball/mens-college-basketball",
      :wcb => "sports/basketball/womens-college-basketball",
      :nba => "sports/basketball/nba",
      :wnba => "sports/basketball/wnba",
      :mlb => "sports/baseball/mlb",
      :pga => "sports/golf/pga",
      :nhl => "sports/hockey/nhl"}

    #self.class.get("/v1/#{resource}/athletes?apikey=#{@key}")
    response = HTTParty.get("http://api.espn.com/v1/#{@leagues[league.to_sym]}/athletes?apikey=#{@key}")
    league_name = response.parsed_response["sports"][0]["leagues"][0]["name"]
    resultsCount = response.parsed_response["resultsCount"]
    resultsLimit = response.parsed_response["resultsLimit"]
    resultsOffset = response.parsed_response["resultsOffset"]
    athletes = response.parsed_response["sports"][0]["leagues"][0]["athletes"]
    until resultsOffset >= resultsCount
    #until resultsOffset >= 100 #For debugging
      response = HTTParty.get("http://api.espn.com/v1/#{@leagues[league.to_sym]}/athletes?apikey=#{@key}&offset=#{resultsOffset}")
      if !response.parsed_response.nil?
        response.parsed_response["sports"][0]["leagues"][0]["athletes"].each do |athlete|
          #TODO: Find or Create a new athlete in the database
          #Athlete.new(athlete).save
          athletes << athlete
        end
      end
      resultsOffset = response.parsed_response["resultsOffset"] + response.parsed_response["resultsLimit"]
    end
    {:league => league_name, :athletes => athletes}
  end
end
