class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :complete]
  before_action :authenticate_user!

  # GET /tasks
  def index
    # ? 
    @owned_tasks = Task.where(user_id: current_user.id).where.not(status: 'completed')
    @unassigned_tasks = Task.where(user_id: nil)
  end

  # GET /tasks/1
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
    @available_projects = Project.all
    @all_users = User.all
  end

  # GET /tasks/1/edit
  def edit
  end
  
  # POST /tasks
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tasks/1
  def update
      if @task.update(task_params)
        redirect_to @task, notice: 'Task was successfully updated.'
      else
        render :edit
      end
    end
  end
  
  # GET /tasks/1/complete
  def complete
    if @task.complete
      redirect_to :back, notice: 'Task was successfully completed.'
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    redirect_to :back, notice: 'Task was successfully destroyed.'
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:description, :status, :project_id, :user_id)
    end
end
