class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :validate_votes_limit, :only => [:upvote]

  def index
    @projects = Project.all
  end

  def upvote
    @project = Project.find(params[:id])
    @project.votes.create(:user_id => current_user.id)

    ProjectRelationship.create(:project_id => @project.id, :user_id => current_user.id)

    flash[:notice] = "为#{@project.name}投票成功"
    redirect_to root_path
  end

  protected

  def validate_votes_limit
    if current_user.votes.count >= 3
      redirect_to "/"
      flash[:alert] ="您的3票已用完"
    end
  end

end
