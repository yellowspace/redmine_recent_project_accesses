require 'projects_controller_hook.rb'

Rails.configuration.to_prepare do
  unless ProjectsController.included_modules.include? RecentProjectAccesses::ProjectsControllerHook
    ProjectsController.send(:include, RecentProjectAccesses::ProjectsControllerHook)
  end
end

Redmine::Plugin.register :redmine_recent_project_accesses do
  name 'Redmine Recent Project Accesses plugin'
  author 'suer'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
end
