class GroupRelationshipsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    group = Group.find(params[:group_id])
    current_user.apply_to(group)
    flash[:success] = 'グループへの加入申請を送りました。'
    redirect_to group
  end

  def destroy
    group = Group.find(params[:group_id])
    group_relationship = GroupRelationship.where(group_id: group.id).find_by(user_id: current_user.id)
    if group_relationship.approval == "pending"
      current_user.cancel_apply_to(group)
      flash[:danger] = '申請をキャンセルしました。'
      redirect_to group
    else
      current_user.cancel_apply_to(group)
      flash[:danger] = 'グループを脱退しました。'
      redirect_to group
    end
      
      
  end
  
  def update
    group = Group.find(params[:group_id])
    group_relationship = GroupRelationship.where(user_id: params[:user_id]).find_by(group_id: params[:group_id])
    group_relationship.approval = "approvaled"
    group_relationship.save
    redirect_to group
  end
end
