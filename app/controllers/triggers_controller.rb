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
        if @trigger.feature == "slack"
        # TriggerSendSlackJob.set(wait_until: @motduedate + @task.delay.days).perform_later(current_user.id, trigger.id)
          TriggerSendSlackJob.perform_now(current_user.id, @trigger.id)
        elsif @trigger.feature == "mail"
          TriggerSendEmailJob.set(wait_until: @motduedate + @task.delay.days).perform_later(current_user.id, @trigger.id)
        end
      html_string = render_to_string( partial: "mots/show_mot_task.html.erb", locals: {task: @task, mot: @task.mot} )
      render json: { html_string: html_string }
    else
     html_string = render_to_string( partial: "triggers/new.html.erb", locals: {task: @task} )
     render json: { html_string: html_string }, status: :not_acceptable
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
    flash[:notice] = "Your trigger has been updated!"
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
    params.require(:trigger).permit(:name, :url, :feature)
  end

  def set_trigger
    @trigger = Trigger.find(params[:id])
    authorize @trigger
  end

end
