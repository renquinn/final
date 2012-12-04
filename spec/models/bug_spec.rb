require 'spec_helper'

describe Bug do
  it "validates presence of name" do
    bug = Bug.new
    bug.should have(1).error_on(:name)
  end

  describe ".my_bugs" do
    it "returns only my bugs" do
      user = User.new(:id => 1)
      user.email = "ASDF@LKAJSDF.com"
      user.password = "qwertyyuu"
      bug = Bug.new
      bug.user_id = 1
      bug.name = "1"
      other_bug = Bug.new
      other_bug.user_id = 2
      other_bug.name = "2"

      user.save!
      bug.save!
      other_bug.save!
      Bug.my_bugs(user.id).size.should eq(1)
    end
  end

  describe ".salutations" do
    it "says hi to a bug" do
      bug = Bug.new
      bug.name = "Sally"
      bug.salutations.should eq("Hello Sally")
    end
  end
end

