class TasksController < ApplicationController
  before_action :set_task, only: [ :destroy, :edit, :update]
  def new
    @task = Task.new
    @mot = Mot.find(params[:mot_id])
    authorize @task
    html_string = render_to_string( partial: "tasks/new.html.erb", locals: {task: @task} )
    render json: { html_string: html_string }
  end

  def create
    @mot = Mot.find(params[:mot_id])
    @task = Task.new(task_params)
    @task.mot = @mot
    authorize @task
    if @task.save
    html_string = render_to_string( partial: "mots/show_mot_task.html.erb", locals: {task: @task, mot: @task.mot} )
    render json: { html_string: html_string }
        else
    html_string = render_to_string( partial: "tasks/new.html.erb", locals: {task: @task} )
    render json: { html_string: html_string }, status: :not_acceptable
    end
  end

  def check
    @task = Task.find(params[:task_id])
    @task.completed = !@task.completed
    @task.save
    authorize @task
    html_string = render_to_string( partial: "mots/show_mot.html.erb", locals: {mot: @task.mot} )
    html_string2 = render_to_string( partial: "mots/show_mot_task.html.erb", locals: {task: @task, mot: @task.mot} )
    render json: { html_string: html_string, html_string2: html_string2 }
  end

  def edit
    @mot = Mot.find(params[:mot_id])
    authorize @task
    html_string = render_to_string( partial: "tasks/new.html.erb", locals: {task: @task} )
    render json: { html_string: html_string }
  end

  def update
    @task.update(task_params)
    @mot = Mot.find(params[:mot_id])
    flash[:notice] = "Your task has been updated!"
    html_string = render_to_string( partial: "mots/show_mot_task.html.erb", locals: {task: @task, mot: @task.mot} )
    render json: { html_string: html_string }
  end

  def destroy
    @task.destroy
    #redirect_to root_path(@task.mot, anchor: "mot-#{@task.mot.id}")
    html_string = render_to_string( partial: "mots/show_mot.html.erb", locals: { mot: @task.mot} )
    render json: { html_string: html_string }
  end

  private

  def task_params
    params.require(:task).permit(:name, :delay, :description, :priority, :completed)
  end
  def set_task
    @task = Task.find(params[:id])
    authorize @task
  end
end
