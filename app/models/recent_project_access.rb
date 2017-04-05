class RecentProjectAccess
  def self.save_access(user, project)
    project_num = Setting['plugin_redmine_recent_project_accesses']['num_of_recent_access_projects'].to_i
    recent_access_project_ids = user.pref[:recent_access_project_ids] || []
    recent_access_project_id = recent_access_project_ids.delete(project.id) || project.id
    recent_access_project_ids.unshift(recent_access_project_id)
    if project_num <= 0
      user.pref[:recent_access_project_ids] = recent_access_project_ids
    else
      user.pref[:recent_access_project_ids] = recent_access_project_ids[0, project_num]
    end
    user.pref.save
  end

  def self.projects(user)
    project_ids = user.current.pref[:recent_access_project_ids] || []
    projects = project_ids.map{|id| Project.where(:id => id).first}.select{|project| project != nil}
  end
end
