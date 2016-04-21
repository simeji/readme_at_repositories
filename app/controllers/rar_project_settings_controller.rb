class RarProjectSettingsController < ApplicationController
  unloadable
  before_filter :find_project, :authorize

  def index
  end

  def create
  end

  def update
    project_id = params[:project_id]
    r = RarProjectSetting.find(project_id)
    r.position = params[:rar_project_setting][:position]
    r.show = params[:rar_project_setting][:show]
    r.save
    redirect_to :controller => 'projects', :action => 'settings', :id => @project.id, :tab => 'readme_at_repositories'
  end

  def find_project
    @project = Project.find(params[:project_id])
  end

end
