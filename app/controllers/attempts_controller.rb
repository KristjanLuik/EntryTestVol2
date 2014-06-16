class AttemptsController < ApplicationController
  before_action :set_attempt, only: [:show, :edit, :update, :destroy, :start, :end, :display]

  # GET /attempts
  # GET /attempts.json
  def index
    @attempts = Attempt.all
  end

  # GET /attempts/1
  # GET /attempts/1.json
  def show
  end

  # GET /attempts/new
  def new
    @attempt = Attempt.new
  end

  # GET /attempts/1/edit
  def edit
  end

  # POST /attempts
  # POST /attempts.json
  def create
    @attempt = Attempt.new(attempt_params)

    respond_to do |format|
      if @attempt.save
        format.html { redirect_to @attempt, notice: 'Attempt was successfully created.' }
        format.json { render :show, status: :created, location: @attempt }
      else
        format.html { render :new }
        format.json { render json: @attempt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attempts/1
  # PATCH/PUT /attempts/1.json
  def update
    respond_to do |format|
      if @attempt.update(attempt_params)
        format.html { redirect_to @attempt, notice: 'Attempt was successfully updated.' }
        format.json { render :show, status: :ok, location: @attempt }
      else
        format.html { render :edit }
        format.json { render json: @attempt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attempts/1
  # DELETE /attempts/1.json
  def destroy
    @attempt.destroy
    respond_to do |format|
      format.html { redirect_to attempts_url }
      format.json { head :no_content }
    end
  end

# display attempt ion test format - meant for simple users
def display

end

# start attempt - set start time and generate test
  def start
   if !@attempt.start then 
     @attempt.start=DateTime.now
     @attempt.generate_test 
      respond_to do |format|
        if @attempt.save
          format.html { redirect_to @attempt, notice: 'Attempt was successfully started.' }
          format.json { render :show, status: :created, location: @attempt }
        else
          format.html { render :show }
          format.json { render json: @attempt.errors, status: :unprocessable_entity }
        end
      end
   else 
    redirect_to @attempt, notice: 'Attempt was already started.' 
   end
  end
# end attempt - set end time and grade the answers
  def end
     @attempt.end=DateTime.now
    respond_to do |format|
      if @attempt.save
        format.html { redirect_to @attempt, notice: 'Attempt was successfully ended.' }
        format.json { render :show, status: :created, location: @attempt }
      else
        format.html { render :show }
        format.json { render json: @attempt.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attempt
      @attempt = Attempt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attempt_params
      params.require(:attempt).permit(:registration_date, :result, :start, :end, :timetable_id, :user_id)
    end
end
