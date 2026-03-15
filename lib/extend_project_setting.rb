module ExtendRarProjectsSetting
  module RarProjectSettingExtension

    def project_settings_tabs
      action = {
        :name => 'readme_at_repositories',
        :controller => 'rar_project_settings',
        :action => :update,
        :partial => 'rar_project_settings/show',
        :label => :label_project_setting_title
      }
      tabs = super
      tabs << action if User.current.allowed_to?(action, @project)
      return tabs
    end

  end
end

