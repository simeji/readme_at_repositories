class RarProjectSetting < ActiveRecord::Base
  unloadable

  if defined?(ProtectedAttributes) || ::ActiveRecord::VERSION::MAJOR < 4
    attr_accessible :project_id, :position, :show
  end
end
