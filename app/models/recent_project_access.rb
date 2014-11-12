class RecentProjectAccess < ActiveRecord::Base
  unloadable
  belongs_to :user
  belongs_to :project

  def self.save_access(user, project)
    access = RecentProjectAccess.where(:user_id => user.id, :project_id => project.id).first
    access ||= RecentProjectAccess.new(:user_id => user.id, :project_id => project.id)
    access.updated_at = Time.now
    access.save
  end
end
