class LabelsQuestionsController < ApplicationController
  before_action :set_labels_question, only: [:show, :edit, :update, :destroy]

  # GET /labels_questions
  # GET /labels_questions.json
  def index
    @labels_questions = LabelsQuestion.all
  end

  # GET /labels_questions/1
  # GET /labels_questions/1.json
  def show
  end

  # GET /labels_questions/new
  def new
    @labels_question = LabelsQuestion.new
  end

  # GET /labels_questions/1/edit
  def edit
  end

  # POST /labels_questions
  # POST /labels_questions.json
  def create
    @labels_question = LabelsQuestion.new(labels_question_params)

    respond_to do |format|
      if @labels_question.save
        format.html { redirect_to @labels_question, notice: 'Labels question was successfully created.' }
        format.json { render :show, status: :created, location: @labels_question }
      else
        format.html { render :new }
        format.json { render json: @labels_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /labels_questions/1
  # PATCH/PUT /labels_questions/1.json
  def update
    respond_to do |format|
      if @labels_question.update(labels_question_params)
        format.html { redirect_to @labels_question, notice: 'Labels question was successfully updated.' }
        format.json { render :show, status: :ok, location: @labels_question }
      else
        format.html { render :edit }
        format.json { render json: @labels_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /labels_questions/1
  # DELETE /labels_questions/1.json
  def destroy
    @labels_question.destroy
    respond_to do |format|
      format.html { redirect_to labels_questions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_labels_question
      @labels_question = LabelsQuestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def labels_question_params
      params.require(:labels_question).permit(:question_id, :label_id)
    end
end
