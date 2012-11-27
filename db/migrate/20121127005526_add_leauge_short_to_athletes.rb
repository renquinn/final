class AddLeaugeShortToAthletes < ActiveRecord::Migration
  def change
    add_column :athletes, :league_short, :string
    rename_column :athletes, :league, :league_long
  end
end
