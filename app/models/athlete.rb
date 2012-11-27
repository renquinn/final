class Athlete < ActiveRecord::Base
  attr_accessible :espn_id, :espn_link, :first_name, :full_name, :last_name, :league_short, :league_long, :short_name

  scope :league, lambda { |l| where("league_short = ?", l) }
end
