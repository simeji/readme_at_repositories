class IndexController < ApplicationController
  unloadable


  def index
    @project = Project.find(params[:project_id])
    #@rar = Index.find(:all) # @project.polls
  end
end
