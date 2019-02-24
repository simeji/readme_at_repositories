class RarProjectSettingsController < ApplicationController
  unloadable
  before_action :find_project, :authorize

  def index
  end

  def create
  end

  def update
    project_id = params[:project_id]
    r = RarProjectSetting.find_or_create_by(project_id: project_id)
    r.position = params[:rar_project_setting][:position]
    r.show = params[:rar_project_setting][:show]
    res = r.save
    if res
      flash[:notice] = "Successful update."
    else
      flash[:warning] = "Update error."
    end
    redirect_to :controller => 'projects', :action => 'settings', :id => @project.id, :tab => 'readme_at_repositories'
  end

  def find_project
    @project = Project.find(params[:project_id])
  end

end
