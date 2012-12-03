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

  def new
    @athlete.user = current_user
  end

  def create
    @athlete = Athlete.new(params[:athlete])
    @athlete.user = current_user

    if @athlete.save
        redirect_to @athlete
    else
        render action: "new"
    end
  end

  def update
    athlete = Athlete.find(params["id"])
    athlete.first_name = params["athlete"]["first_name"]
    athlete.last_name = params["athlete"]["last_name"]
    athlete.save
    redirect_to athletes_path
  end

  def destroy
    athlete = Athlete.find(params[:id])
    athlete.destroy

    redirect_to athletes_path
  end

  def show
    @athlete = Athlete.find(params[:id])
  end
end
