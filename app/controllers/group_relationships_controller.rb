class GroupRelationshipsController < ApplicationController
  def create
    group = Group.find(params[:group_id])
    current_user.apply_to(group)
    flash[:success] = 'グループへの加入申請を送りました。'
    redirect_to group
  end

  def destroy
    group = Group.find(params[:group_id])
    current_user.cancel_apply_to(group)
    flash[:danger] = '申請をキャンセルしました。'
    redirect_to group
  end
end
