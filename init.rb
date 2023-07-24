require File.expand_path('lib/display_readme', __dir__)
require File.expand_path('lib/extend_rar_projects_setting', __dir__)
require File.expand_path('lib/rar_project_setting_extension', __dir__)

Redmine::Plugin.register :readme_at_repositories do
  name 'Readme At Repositories plugin'
  author 'Tsubasa Nagasawa'
  description 'Display "README" at repository tab'
  version '0.3.0'
  url 'https://github.com/simeji/readme_at_repositories'
  author_url 'https://github.com/simeji/readme_at_repositories'

  project_module :readme_at_repository do
    permission :manage, :rar_project_settings => [:update], :require => :member
  end
end

ActiveSupport::Reloader.to_prepare do
  require_dependency 'projects_helper'
  unless ProjectsHelper.included_modules.include? ExtendRarProjectsSetting
    ProjectsHelper.send(:include, ExtendRarProjectsSetting)
  end
end
