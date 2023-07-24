require_dependency 'projects_helper'

module ExtendRarProjectsSetting
  def self.included(base)
    base.send(:include, RarProjectSettingExtension)

    base.class_eval do
      unloadable
      # alias_method_chain :project_settings_tabs, :readme_at_repositories
    end

  end
end
