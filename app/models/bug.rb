class Bug < ActiveRecord::Base
  attr_accessible :name, :species, :user_id
  belongs_to :user
  validates_presence_of :name
  validates_uniqueness_of :name
  scope :my_bugs, lambda { |u| where("user_id= ?", u) }

  def salutations
    "Hello #{self.name}"
  end

  def master
    User.find(self.user_id).email
  end
end
