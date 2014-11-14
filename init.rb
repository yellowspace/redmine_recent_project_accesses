require 'projects_controller_hook.rb'
require 'recent_project_acccesses_listener'

Rails.configuration.to_prepare do
  unless ProjectsController.included_modules.include? RecentProjectAccesses::ProjectsControllerHook
    ProjectsController.send(:include, RecentProjectAccesses::ProjectsControllerHook)
  end
end

Redmine::Plugin.register :redmine_recent_project_accesses do
  name 'Redmine Recent Project Accesses plugin'
  author 'suer'
  description 'shows projects in the order of accessing'
  version '0.0.1'
  url 'https://github.com/suer/redmine_recent_project_accesses'
  author_url 'http://d.hatena.ne.jp/suer'

  settings(:default => { 'num_of_recent_access_projects' => 10 }, :partial => 'settings/recent_access_projects_settings')
end
