class TasksController < ApplicationController
  before_action :set_task, only: [ :destroy, :edit, :update]
  def new
    @task = Task.new
    @mot = Mot.find(params[:mot_id])
    authorize @task
  end

  def create
    @mot = Mot.find(params[:mot_id])
    @task = Task.new(task_params)
    @task.mot = @mot
    authorize @task
    if @task.save
      redirect_to mots_path
    else
      render :new
    end
  end

  def edit
    @mot = Mot.find(params[:mot_id])
    authorize @task
  end

  def update
    @task.update(task_params)
    @mot = Mot.find(params[:mot_id])
    redirect_to mots_path
  end

  def destroy
    @task.destroy
    @mot = Mot.find(params[:mot_id])
    redirect_to mot_path(@mot)
  end

  private

  def task_params
    params.require(:task).permit(:name, :delay, :description, :priority)
  end
  def set_task
    @task = Task.find(params[:id])
    authorize @task
  end
end
