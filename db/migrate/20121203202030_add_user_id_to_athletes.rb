class AddUserIdToAthletes < ActiveRecord::Migration
  def change
    add_column :athletes, :user_id, :integer
  end
end
