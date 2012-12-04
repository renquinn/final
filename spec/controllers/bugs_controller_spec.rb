require 'spec_helper'

describe BugsController do

  describe "#index" do
    it "renders success" do
      get "index"
      response.should be_success
    end

    it "assigns an array of bugs" do
      bug = Bug.create! :name => "Bob"
      get "index"
      assigns(:bugs).should == [bug]
    end
  end

  describe "#show" do
    it "renders success" do
      bug = Bug.create! :name => "Bob"
      get "show", :id => bug.id
      response.should be_success
    end

    it "assigns an existing bug" do
      bug = Bug.create! :name => "Bob"
      get "show", :id => bug.id
      assigns(:bug).should == bug
    end
  end

  describe "#new" do
    it "renders success" do
      get "new"
      response.should be_success
    end

    it "assigns a new bug" do
      get "new"
      assigns(:bug).should be_new_record
    end
  end

  describe "#edit" do
    it "renders success" do
      bug = Bug.create! :name => "Bob"
      get "edit", :id => bug.id
      response.should be_success
    end

    it "assigns an existing bug" do
      bug = Bug.create! :name => "Bob"
      get "edit", :id => bug.id
      assigns(:bug).should == bug
    end
  end

  describe "#create" do
    it "creates a new bug" do
      expect {
        post "create", :bug => { :name => "Bob" }
      }.to change { Bug.count }.by(1)
    end
  end

  describe "#update" do
    it "updates the bug" do
      bug = Bug.create! :name => "Bob"
      put "update", :id => bug.id, :bug => { :name => "Fred" }
      assigns(:bug).name.should == "Fred"
    end

    it "redirects to the bug" do
      bug = Bug.create! :name => "Bob"
      put "update", :id => bug.id
      response.should redirect_to(assigns(:bug))
    end
  end

  describe "#destroy" do
    it "destroys a bug" do
      bug = Bug.create! :name => "Bob"
      expect {
        delete "destroy", :id => bug.id
      }.to change { Bug.count }.by(-1)
    end

    it "redirects to bugs" do
      bug = Bug.create! :name => "Bob"
      delete "destroy", :id => bug.id
      response.should redirect_to(bugs_path)
    end
  end

end
