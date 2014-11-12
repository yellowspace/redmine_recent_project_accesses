class RecentProjectAccess < ActiveRecord::Base
  unloadable
  belongs_to :user
  belongs_to :project

  def self.save_access(user, project)
    access = RecentProjectAccess.new
    access.user = user
    access.project = project
    access.save
  end
end
