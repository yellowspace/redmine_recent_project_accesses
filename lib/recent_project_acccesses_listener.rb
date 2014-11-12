module RecentProjectAccesses
  class ViewListener < Redmine::Hook::ViewListener
    def view_welcome_index_right(context)
      accesses = RecentProjectAccess.where(:user_id => User.current.id).order('updated_at desc').all
      context[:controller].send(:render_to_string, {
        :partial => 'recent_project_accesses/right',
        :locals => {:accesses => accesses}
      })
    end
  end
end
