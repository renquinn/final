class ChangeBugsTypeToSpecies < ActiveRecord::Migration
  def change
    rename_column :bugs, :type, :species
  end
end
