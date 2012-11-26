class CreateAthletes < ActiveRecord::Migration
  def change
    create_table :athletes do |t|
      t.string :first_name
      t.string :last_name
      t.string :league
      t.string :espn_link
      t.integer :espn_id
      t.string :full_name
      t.string :short_name

      t.timestamps
    end
  end
end
