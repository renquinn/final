namespace :espn do
  namespace :athletes do
    desc "Load all leagues data from the ESPN athletes api"
    task :all => :environment do
      leagues = [ "nfl", "cf", "mcb", "wcb", "nba", "wnba", "mlb", "pga", "nhl"]
      leagues.each do |league|
        puts "\nFetching data for #{league}..."
        response = Espn.athletes league
        save_athletes(response)
      end
    end

    desc "Load nfl data from the ESPN athletes api"
    task :nfl => :environment do
      response = Espn.athletes "nfl"
      save_athletes(response)
    end

    desc "Load college football data from the ESPN athletes api"
    task :cf => :environment do
      response = Espn.athletes "cf"
      save_athletes(response)
    end

    desc "Load men's college basketball data from the ESPN athletes api"
    task :mcb => :environment do
      response = Espn.athletes "mcb"
      save_athletes(response)
    end

    desc "Load women's college basketball data from the ESPN athletes api"
    task :wcb => :environment do
      response = Espn.athletes "wcb"
      save_athletes(response)
    end

    desc "Load nba data from the ESPN athletes api"
    task :nba => :environment do
      response = Espn.athletes "nba"
      save_athletes(response)
    end

    desc "Load wnba data from the ESPN athletes api"
    task :wnba => :environment do
      response = Espn.athletes "wnba"
      save_athletes(response)
    end

    desc "Load mlb data from the ESPN athletes api"
    task :mlb => :environment do
      response = Espn.athletes "mlb"
      save_athletes(response)
    end

    desc "Load pga data from the ESPN athletes api"
    task :pga => :environment do
      response = Espn.athletes "pga"
      save_athletes(response)
    end

    desc "Load nhl data from the ESPN athletes api"
    task :nhl => :environment do
      response = Espn.athletes "nhl"
      save_athletes(response)
    end

    def save_athletes(response)
      athletes = response[:athletes]

      athletes.each do |athlete|
        existing = Athlete.where(:espn_id => athlete["id"], :full_name => athlete["fullName"])
        if existing == []
          a = Athlete.new
          a.first_name = athlete["firstName"]
          a.last_name = athlete["lastName"]
          a.full_name = athlete["fullName"]
          a.short_name = athlete["shortName"]
          a.espn_id = athlete["id"]
          a.espn_link = athlete["links"]["web"]["athletes"]["href"]
          a.league_short = response[:league_short]
          a.league_long = response[:league_long]
          a.save
        end
      end
    end
  end
end
