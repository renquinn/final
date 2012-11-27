class AthletesController < ApplicationController
  def index
    @l = params["post"]["league"]
    @athletes = Athlete.league(@l)
    @league = @athletes.first.league_long
  end
end
