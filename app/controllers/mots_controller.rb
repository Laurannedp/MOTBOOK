class MotsController < ApplicationController
before_action :set_mot, only: [:show, :edit, :update, :destroy]
    def index
      if params[:query].present?
      sql_query = " \
        mots.name ILIKE :query \
        OR mots.description ILIKE :query \
        OR tasks.name ILIKE :query \
        OR tasks.description ILIKE :query \
      "
      @mots = Mot.joins(:tasks).where(sql_query, query: "%#{params[:query]}%")
      @mots = policy_scope(@mots).uniq
     else
        @mots = policy_scope(Mot)
      end
      @mot = Mot.new
    end

    def show
      @task = Task.new
      @task = policy_scope(Task)
      html_string = render_to_string( partial: "mots/show_mot.html.erb", locals: {mot: @mot} )
      render json: { html_string: html_string }
    end

    def new
      @mot = Mot.new
      authorize @mot
      html_string = render_to_string( partial: "mots/new.html.erb", locals: {mot: @mot} )
      render json: { html_string: html_string }
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
        redirect_to mot_path
    end

    def destroy
        @mot.destroy
        redirect_to mot_path
    end

    private

    def mot_params
      params.require(:mot).permit(:name, :duedate, :description, :tag, :emoticon)
    end

  def set_mot
      @mot = Mot.find(params[:id])
      authorize @mot
  end
end
