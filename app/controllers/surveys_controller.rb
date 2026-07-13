class SurveysController < ApplicationController
  # Include :answer in the before_action filter to load the survey automatically
  before_action :set_survey, only: %i[ show edit update destroy answer ]

  # GET /surveys or /surveys.json
  def index
    @surveys = Survey.all
  end

  # GET /surveys/1 or /surveys/1.json
  def show
  end

  # GET /surveys/1/answer
  # Renders the public customer/employee form view
  def answer
    # @survey is already set by the before_action filter
  end

  # GET /surveys/new
  def new
    @survey = Survey.new
  end

  # GET /surveys/1/edit
  def edit
  end

  # POST /surveys or /surveys.json
  def create
    @survey = Survey.new(survey_params)

    respond_to do |format|
      if @survey.save
        format.html { redirect_to @survey, notice: "Survey was successfully created." }
        format.json { render :show, status: :created, location: @survey }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @survey.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /surveys/1 or /surveys/1.json
  def update
    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to @survey, notice: "Survey was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @survey }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @survey.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /surveys/1 or /surveys/1.json
  def destroy
    @survey.destroy!

    respond_to do |format|
      format.html { redirect_to surveys_path, notice: "Survey was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      # Using Rails 8 strong parameter expectations for the ID parameter
      @survey = Survey.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def survey_params
      params.expect(survey: [ :title, :description ])
    end
end