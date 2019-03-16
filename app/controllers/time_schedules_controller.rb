class TimeSchedulesController < ApplicationController
  
  def new
    @time_schedule = TimeSchedule.new
  end
  
  def create
    @event = Event.find(params[:event_id])
    @time_schedule = @event.time_schedules.build(time_schedule_params)
    if @time_schedule.save
      flash[:success] = "スケジュールを追加しました。"
      redirect_to @event
    else
      flash[:danger] = "スケジュールの追加に失敗しました。"
      redirect_to @event
    end
  end

  def edit
  end

  def destroy
    @time_schedule = TimeSchedule.find(params[:id])
    @event = @time_schedule.event
    if @time_schedule.destroy
      flash[:success] = "スケジュールを削除しました。"
      redirect_to @event
    else
      flash[:danger] = "スケジュールの削除に失敗しました。"
      redirect_to @event
    end
  end
  
  
  private
  
  def time_schedule_params
    params.require(:time_schedule).permit(:event_id, :time, :content)
  end
end
