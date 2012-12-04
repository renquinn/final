class Bug < ActiveRecord::Base
  attr_accessible :name, :type, :user_id
  validates_presence_of :name
end
