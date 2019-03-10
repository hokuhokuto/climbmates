class ToppagesController < ApplicationController
  def index
    if logged_in?
      @groups = current_user_join_groups.page(params[:page])
    end
  end
end


  private
  
  def current_user_join_groups
    group_ids = GroupRelationship.where(user_id: current_user.id).where(approval: "approvaled").select("group_id")
    Group.all.where(id: group_ids).order("updated_at DESC")
  end