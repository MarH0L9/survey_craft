class QuestionsController < ApplicationController
  before_action :set_survey
  before_action :set_question, only: %i[ show edit update destroy ]

  # GET /surveys/:survey_id/questions
  def index
    @questions = @survey.questions
  end

  # GET /surveys/:survey_id/questions/1
  def show
  end

  # GET /surveys/:survey_id/questions/new
  def new
    @question = @survey.questions.build
  end

  # GET /surveys/:survey_id/questions/1/edit
  def edit
  end

  # POST /surveys/:survey_id/questions
  def create
    @question = @survey.questions.build(question_params)

    if @question.save
      redirect_to @survey, notice: "Question was successfully created."
    else
      redirect_to @survey, alert: "Error creating the question."
    end
  end

  # PATCH/PUT /surveys/:survey_id/questions/1
  def update
    if @question.update(question_params)
      redirect_to @survey, notice: "Question was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  # DELETE /surveys/:survey_id/questions/1
  def destroy
    @question.destroy!
    redirect_to @survey, notice: "Question was successfully destroyed.", status: :see_other
  end

private
    # Find the survey for all actions
    def set_survey
      @survey = Survey.find(params[:survey_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = @survey.questions.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def question_params
      # Added :question_type to the permitted parameters list
      params.expect(question: [ :survey_id, :content, :question_type ])
    end
end