class TriggersController < ApplicationController
  before_action :set_trigger, only: [ :destroy, :edit, :update]

  def index
  end

  def show
  end

  def new
    @trigger = Trigger.new
    @task = Task.find(params[:task_id])
    @mot = Mot.find(params[:mot_id])
    authorize @trigger
    html_string = render_to_string( partial: "triggers/new.html.erb", locals: {task: @task} )
    render json: { html_string: html_string }
  end

  def create
    @mot = Mot.find(params[:mot_id])
    @task = Task.find(params[:task_id])
    @trigger = Trigger.new(trigger_params)
    @trigger.task = @task
    authorize @trigger
    if @trigger.save
      redirect_to mots_path
    else
      render :new
    end
  end

  def edit
    @mot = Mot.find(params[:mot_id])
    @task = Task.find(params[:task_id])
    authorize @trigger
    html_string = render_to_string( partial: "triggers/new.html.erb", locals: {task: @task} )
    render json: { html_string: html_string }
  end

  def update
    @trigger.update(trigger_params)
    @mot = Mot.find(params[:mot_id])
    @task = Task.find(params[:task_id])
      if @trigger.feature == "mail"
        UserMailer.reminder.deliver_now
      end
    redirect_to mots_path
  end

  def destroy
    @trigger.destroy
    @task = Task.find(params[:task_id])
    @mot = Mot.find(params[:mot_id])
    redirect_to mot_path(@mot)
  end

    private

  def trigger_params
    params.require(:trigger).permit(:name, :url)
  end

  def set_trigger
    @trigger = Trigger.find(params[:id])
    authorize @trigger
  end

end
