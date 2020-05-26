class MotsController < ApplicationController
before_action :set_mot, only: [:show, :edit, :update, :destroy]
    def index
      if params[:query].present?
        @mots = policy_scope(Mot.where(name: params[:query]))
      else
        @mots = policy_scope(Mot)
      end
    end

    def show
      @task = Task.new
      @task = policy_scope(Task)
    end

    def new
        @mot = Mot.new
    end

    def create
        @mot = Mot.new(mot_params)
        @mot.user = current_user
        authorize @mot
        if @mot.save
            redirect_to mot_path(@mot)
          else
            render :new
          end
    end

    def edit
      @mots = policy_scope(Mot)
    end

    def update
        @mot.update(mot_params)
        redirect_to mots_path
    end

    def destroy
        @mot.destroy
        redirect_to mots_path
    end

    private

    def restaurant_params
      params.require(:mot).permit(:name, :duedate, :description, :tag, :emoticon)
    end

   def set_mot
      @mot = Mot.find(params[:id])
      authorize @mot
    end
end

