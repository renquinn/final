require 'spec_helper'

describe Bug do
  it "validates presence of name" do
    bug = Bug.new
    bug.should have(1).error_on(:name)
  end
end

