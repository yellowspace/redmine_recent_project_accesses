class RecentProjectAccess
  def self.save_access(user, project)
    recent_access_project_ids = user.pref[:recent_access_project_ids] || []
    recent_access_project_id = recent_access_project_ids.delete(project.id) || project.id
    recent_access_project_ids.unshift(recent_access_project_id)
    user.pref[:recent_access_project_ids] = recent_access_project_ids
    user.pref.save
  end
end
