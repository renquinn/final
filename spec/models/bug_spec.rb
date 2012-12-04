require 'spec_helper'

describe Bug do
  it "validates presence of name" do
    bug = Bug.new
    bug.should have(1).error_on(:name)
  end

  describe ".my_bugs" do
    it "returns only my bugs" do
      user = User.new
      bug = Bug.new
      bug.user_id = user.id
      Bug.my_bugs.size.should be(1)
    end
  end
end

