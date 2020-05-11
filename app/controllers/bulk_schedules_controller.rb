class BulkSchedulesController < ApplicationController
  def new
    @bulk_schedule = Forms::BulkSchedule.new
  end

  def create
    render plain: params.inspect
  end
end
