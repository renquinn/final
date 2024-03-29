class Athlete < ActiveRecord::Base
  attr_accessible :espn_id, :espn_link, :first_name, :full_name, :last_name, :league_short, :league_long, :short_name
  belongs_to :user

  scope :league, lambda { |l| where("league_short = ?", l).order("last_name") }

  def self.leagues
    [
      "nfl",
      "nba",
      "wnba",
      "mlb",
      "pga",
      "nhl"
    ]
  end
end
