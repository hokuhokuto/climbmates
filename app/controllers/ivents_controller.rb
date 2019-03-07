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

  def update
  end

  def destroy
  end
  
  
  def ivent_params
    params.require(:ivent).permit(:group_id, :title, :date, :content)
  end
end
