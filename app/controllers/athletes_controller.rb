class AthletesController < ApplicationController
  def index
    if params["post"]
      @l = params["post"]["league"]
    else
      @l = "nfl"
    end
    @athletes = Athlete.league(@l)
    @league = @athletes.first.league_long
  end
end
