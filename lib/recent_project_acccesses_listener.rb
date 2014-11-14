module RecentProjectAccesses
  class ViewListener < Redmine::Hook::ViewListener
    def view_welcome_index_right(context)
      project_ids = User.current.pref[:recent_access_project_ids] || []
      projects = project_ids.map{|id| Project.where(:id => id).first}.select{|project| project != nil}
      context[:controller].send(:render_to_string, {
        :partial => 'recent_project_accesses/right',
        :locals => {:projects => projects}
      })
    end
  end
end
