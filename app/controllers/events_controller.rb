class EventsController < ApplicationController
  before_action :event_owner?, only: [:edit,:update,:destroy]
  before_action :event_member?, only: [:show]
  
  
  def new
    @event = Event.new
    @group = Group.find(params[:group_id])
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      redirect_to @event
    else
      render :new
    end
  end
  
  def show
    @event = Event.find_by(id: params[:id])
    @time_schedules = TimeSchedule.where(event_id: @event.id)
  end
  
  def edit
    @event = Event.find_by(id: params[:id])
  end

  def update
    @event = Event.find_by(id: params[:id])
    if @event.user == current_user
      if @event.update(event_params)
        flash[:success] = "イベントを編集しました。"
        redirect_to @event
      else
        flash[:danger] = 'イベントの編集に失敗しました。'
        render :edit
      end
    else
      redirect_to @event
    end
      
  end

  def destroy
    @event = Event.find_by(id: params[:id])
    @group = @event.group
    if @event.user == current_user
      if @event.destroy
        flash[:success] = "イベントを削除しました。"
        redirect_to @group
      else
        flash[:danger] = "イベントを削除できませんでした。"
        render @event
      end
    end
      
  end
  
  private
  
  def event_params
    params.require(:event).permit(:group_id, :title, :date, :content)
  end
  
  def event_member?
    event = Event.find(params[:id])
    unless event.group.group_relationships.find_by(user_id: current_user.id)
      redirect_to group_url(event.group)
    end
  end
  
  def event_owner?
    event = Event.find(params[:id])
    unless event.user == current_user
      redirect_to group_url(event.group)
    end
  end
end
