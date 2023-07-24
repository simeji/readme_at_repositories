require_dependency 'projects_helper'

module RarProjectSettingExtension
  def project_settings_tabs_with_readme_at_repositories
    action = {
      :name => 'readme_at_repositories', 
      :controller => 'rar_project_settings', 
      :action => :update, 
      :partial => 'rar_project_settings/show', 
      :label => :label_project_setting_title
    }
    tabs = project_settings_tabs_without_readme_at_repositories
    tabs << action if User.current.allowed_to?(action, @project)
    tabs
  end
end
