class BugsController < InheritedResources::Base
  load_and_authorize_resource
  def create
    @bug = Bug.new(params[:bug])
    @bug.user = current_user
    @bug.user.bugs << @bug
    @bug.user.save
    @bug.save
    create!
  end
end
