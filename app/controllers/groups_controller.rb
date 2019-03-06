class GroupsController < ApplicationController
  before_action :require_user_logged_in
  before_action :group_owner?, only: [:edit, :update, :destroy]
  

  def index
    @groups = Group.all.order("updated_at DESC")
  end

  def show
    @group = Group.find_by(id: params[:id])
    @groups = Group.where(id: params[:id])
    @join_wish_users = User.all.where(id: pending_user_id)
    @joined_users = User.all.where(id: joined_user_id)
  end

  def new
    @group = Group.new
  end
  
  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      relationship = current_user.group_relationships.build(group_id: @group.id, approval: 1)
      relationship.save
      flash[:success] = 'グループを作成しました。'
      redirect_to @group
    else
      flash.now[:danger] = 'グループの作成に失敗しました。'
      render :new
    end
  end

  def edit
    @group = Group.find_by(id: params[:id])
  end
  
  def update
    @group = Group.find_by(id: params[:id])
    @group.update(group_params)
    if @group.save
      flash[:success] = '編集しました。'
      redirect_to @group
    else
      flash.now[:danger] = '編集に失敗しました。'
      render :edit
    end
  end

  def destroy
    @group = Group.find_by(id: params[:id])
    if @group.user_id == current_user.id
      @group.destroy
      flash[:success] = 'グループを削除しました。'
      redirect_to groups_path
    else
      flash[:caution] = 'グループを削除できませんでした。'
      render group_path(@group.id)
    end
  end
  
  def my_groups
    @groups = current_user.groups
  end
    


  
  private
  
  def pending_user_id
    GroupRelationship.where(group_id: @group.id).where(approval: "pending").select("user_id")
  end
  
  def joined_user_id
    GroupRelationship.where(group_id: @group.id).where(approval: "approvaled").select("user_id")
  end
  
  def group_owner?
    group = Group.find(params[:id])
    unless group.user_id == current_user.id
      redirect_to groups_path
    end
  end
  
  def group_params
    params.require(:group).permit(:name, :info, :image, :user)
  end
end
