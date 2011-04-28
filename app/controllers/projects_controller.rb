class ProjectsController < ApplicationController
  before_filter :find_project, :only => [:show, :edit, :update, :destroy]

  def index
    @projects = Project.scoped
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      redirect_to @project, :notice => "Project has been created."
    else
      flash[:alert] = "Project has not been created."
      render :action => "new"
    end
  end

  def edit
  end

  def update
    if @project.update_attributes(params[:project])
      redirect_to @project, :notice => "Project has been updated."
    else
      flash[:alert] = "Project has not been updated."
      render :action => "edit"
    end
  end

  def show
  end

  def destroy
    @project.destroy
    redirect_to projects_path, :notice => "Project has been deleted."
  end

private
  def find_project
    @project = Project.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The project you were looking" +
                    " for could not be found."
    redirect_to projects_path
  end
end
