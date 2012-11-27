ActiveAdmin.register Athlete do
  index do
    column :id
    column :league_short
    column :espn_id
    column :first_name
    column :last_name
    column :short_name
    column :full_name
    column :league_long
    column :espn_link
    default_actions
  end
  filter :league_short, :as => :check_boxes, :collection => proc { Athlete.leagues }, :label => "By League"
end
