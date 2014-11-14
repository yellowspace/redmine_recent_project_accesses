class RecentProjectAccess
  def self.save_access(user, project)
    project_num = Setting['plugin_redmine_recent_project_accesses']['num_of_recent_access_projects'].to_i
    project_num = 10 if project_num <= 0
    recent_access_project_ids = user.pref[:recent_access_project_ids] || []
    recent_access_project_id = recent_access_project_ids.delete(project.id) || project.id
    recent_access_project_ids.unshift(recent_access_project_id)
    user.pref[:recent_access_project_ids] = recent_access_project_ids[0, project_num]
    user.pref.save
  end
end
