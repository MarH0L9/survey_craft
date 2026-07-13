class AnswersController < ApplicationController
  before_action :set_answer, only: %i[ show edit update destroy ]

  # GET /answers or /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1 or /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers or /answers.json
  # Handles multi-answer submissions from the public user view
  def create
    if params[:answers].present?
      # Iterate through each submitted question ID and its corresponding value
      params[:answers].each do |question_id, response_content|
        # Skip creating database entries if the field was left blank
        next if response_content.blank?

        Answer.create!(
          question_id: question_id,
          content: response_content
        )
      end

      # Redirect cleanly back to the home view with a success toast notification
      redirect_to root_path, notice: "Thank you! Your responses have been submitted successfully."
    else
      # Fallback if the request arrived without any structured payload data
      redirect_to root_path, alert: "No answers were provided."
    end
  end

  # PATCH/PUT /answers/1 or /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer, notice: "Answer was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @answer.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /answers/1 or /answers/1.json
  def destroy
    @answer.destroy!

    respond_to do |format|
      format.html { redirect_to answers_path, notice: "Answer was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def answer_params
      params.expect(answer: [ :question_id, :content ])
    end
end