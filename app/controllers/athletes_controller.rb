class AthletesController < ApplicationController
  def index
    puts params
    @athletes = Athlete.league("nfl")
    @league = @athletes.first.league_long
  end
end
