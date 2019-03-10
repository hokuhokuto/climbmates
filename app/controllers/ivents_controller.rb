class IventsController < ApplicationController
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
  
  
  def ivent_params
    params.require(:ivent).permit(:group_id, :title, :date, :content)
  end
end
