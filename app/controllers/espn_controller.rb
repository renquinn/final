class EspnController < ApplicationController

  def index
    response = Espn.athletes
    @league = response[:league]
    @athletes = response[:athletes]
    @athletes.each do |athlete|
      puts "-"*80
      puts athlete.inspect
      puts "="*80
    end
  end

end
