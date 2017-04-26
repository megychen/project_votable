class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def upvote
    @project = Project.find(params[:id])
    @project.votes.create
    flash[:notice] = "为#{@project.name}投票成功"
    redirect_to root_path
  end

end
