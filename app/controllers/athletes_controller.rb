class AthletesController < ApplicationController
  load_and_authorize_resource
  def index
    if params["post"]
      @l = params["post"]["league"]
    else
      @l = "nfl"
    end
    @athletes = Athlete.league(@l)
    @league = @athletes.first.league_long
  end

  def create
    @athlete.user = current_user
  end
end
