class SchedulesController < ApplicationController
  before_action :set_schedule, only: %i[ show edit update destroy ]

  # GET /schedules or /schedules.json
  def index
    @schedules = Schedule.all
  end

  # GET /schedules/1 or /schedules/1.json
  def show
    @schedule = Schedule.find(params[:id])
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
  end

  # GET /schedules/1/edit
  def edit
    @user = Schedule.find(params[:id])
  end

  # POST /schedules or /schedules.json
  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:name, :start, :end_day, :check, :introduction))

      if @schedule.save
        flash[:notice] = "スケジュールを追加しました"
        redirect_to :schedules
      else
        respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
        end
      end
  end

  # PATCH/PUT /schedules/1 or /schedules/1.json
  def update
    @schedule = Schedule.find(params[:id])

    if @schedule.update(params.require(:schedule).permit(:name, :start, :end_day, :check, :introduction))
      flash[:notice] = "スケジュールを更新しました"
      redirect_to :schedules
    else
      respond_to do |format|
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1 or /schedules/1.json
  def destroy
    @schedule.destroy

    respond_to do |format|
      format.html { redirect_to schedules_url, notice: "Schedule was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def schedule_params
      params.require(:schedule).permit(:name, :start, :end_day, :check, :introduction)
    end
end
