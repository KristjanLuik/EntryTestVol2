class AttemptQuestionsController < ApplicationController
  before_action :set_attempt_question, only: [:show, :edit, :update, :destroy]

  # GET /attempt_questions
  # GET /attempt_questions.json
  def index
    @attempt_questions = AttemptQuestion.all
  end

  # GET /attempt_questions/1
  # GET /attempt_questions/1.json
  def show
  end

  # GET /attempt_questions/new
  def new
    @attempt_question = AttemptQuestion.new
  end

  # GET /attempt_questions/1/edit
  def edit
  end

  # POST /attempt_questions
  # POST /attempt_questions.json
  def create
    @attempt_question = AttemptQuestion.new(attempt_question_params)

    respond_to do |format|
      if @attempt_question.save
        format.html { redirect_to @attempt_question, notice: 'Attempt question was successfully created.' }
        format.json { render :show, status: :created, location: @attempt_question }
      else
        format.html { render :new }
        format.json { render json: @attempt_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attempt_questions/1
  # PATCH/PUT /attempt_questions/1.json
  def update
    respond_to do |format|
      if @attempt_question.update(attempt_question_params)
        format.html { redirect_to @attempt_question, notice: 'Attempt question was successfully updated.' }
        format.json { render :show, status: :ok, location: @attempt_question }
      else
        format.html { render :edit }
        format.json { render json: @attempt_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attempt_questions/1
  # DELETE /attempt_questions/1.json
  def destroy
    @attempt_question.destroy
    respond_to do |format|
      format.html { redirect_to attempt_questions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attempt_question
      @attempt_question = AttemptQuestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attempt_question_params
      params.require(:attempt_question).permit(:question_id, :attempt_id)
    end
end
