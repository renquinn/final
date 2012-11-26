class Athlete < ActiveRecord::Base
  attr_accessible :espn_id, :espn_link, :first_name, :full_name, :last_name, :league, :short_name

  scope :league, lambda { |l| where("league = ?", l) }
  #Athlete.league("National Football League") #TODO: Add a league abbreviation field
end
