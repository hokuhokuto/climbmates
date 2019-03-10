class IventsController < ApplicationController
  before_action :ivent_owner?, only: [:edit,:update,:destroy]
  before_action :ivent_member?, only: [:show]
  
  
  def new
    @ivent = Ivent.new
    @group = Group.find(params[:group_id])
  end

  def create
    @ivent = Ivent.new(ivent_params)
    @ivent.user_id = current_user.id
    if @ivent.save
      redirect_to @ivent
    else
      render :new
    end
  end
  
  def show
    @ivent = Ivent.find_by(id: params[:id])
  end
  
  def edit
    @ivent = Ivent.find_by(id: params[:id])
  end

  def update
    @ivent = Ivent.find_by(id: params[:id])
    if @ivent.user == current_user
      if @ivent.update(ivent_params)
        flash[:success] = "イベントを編集しました。"
        redirect_to @ivent
      else
        flash[:danger] = 'イベントの編集に失敗しました。'
        render :edit
      end
    else
      redirect_to @ivent
    end
      
  end

  def destroy
  end
  
  private
  
  def ivent_params
    params.require(:ivent).permit(:group_id, :title, :date, :content)
  end
  
  def ivent_member?
    ivent = Ivent.find(params[:id])
    unless ivent.group.group_relationships.find_by(user_id: current_user.id)
      redirect_to group_url(ivent.group)
    end
  end
  
  def ivent_owner?
    ivent = Ivent.find(params[:id])
    unless ivent.user == current_user
      redirect_to group_url(ivent.group)
    end
  end
  
end
