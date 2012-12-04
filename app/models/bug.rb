class Bug < ActiveRecord::Base
  attr_accessible :name, :type, :user_id
  validates_presence_of :name
  validates_uniqueness_of :name
  scope :my_bugs, lambda { |u| where("user_id= ?", u) }

  def salutations
    "Hello #{self.name}"
  end
end
