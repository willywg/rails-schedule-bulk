class BulkSchedulesController < ApplicationController
  def new
    @bulk_schedule = Forms::BulkSchedule.new
  end

  def create
    @bulk_schedule = Forms::BulkSchedule.new(bulk_schedule_params)

    if @bulk_schedule.save
      redirect_to root_path, notice: 'Horarios creados con éxito!!!'
    else
      render :new
    end
    # render plain: params.inspect
  end

  private
    def bulk_schedule_params
      params.require(:bulk_schedule).permit(
        :start_at,
        :end_at,
        :days => {}
      )
    end
end
