require 'redmine'

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

Rails.configuration.to_prepare do
  require_dependency 'display_readme'
  require_dependency 'extend_project_setting'
end 
