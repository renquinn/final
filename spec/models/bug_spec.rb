require 'spec_helper'

describe Bug do
  it "validates presence of name" do
    bug = Bug.new
    bug.should have(1).error_on(:name)
  end

  it "validates uniqueness of name" do
    bug = Bug.new
    bug.name = "Clone"
    bug.save!

    copy_bug = Bug.new
    copy_bug.name = "Clone"
    copy_bug.save
    copy_bug.should have(1).error_on(:name)
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

  describe ".master" do
    it "returns my master's email" do
      user = User.new(:id => 1)
      user.email = "reniscool@gmail.com"
      user.password = "asdfersdfa"
      user.save!

      bug = Bug.new
      bug.user_id = user.id
      bug.name = "Molly"
      bug.save!

      bug.master.should eq("reniscool@gmail.com")
    end
  end
end

