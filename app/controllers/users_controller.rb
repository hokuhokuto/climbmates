class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザーを登録しました。'
      redirect_to login_url
    else
      flash.now[:danger] = 'ユーザーの登録に失敗しました。'
      render :new
    end
  end
  
  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def update
    @user = User.find_by(id: params[:id])
    @user.update(user_params)
    if @user.save
      flash[:success] = 'ユーザー情報を編集しました。'
      redirect_to @user
    else
      flash[:danger] = 'ユーザー情報の編集に失敗しました。'
      render :edit
    end
  end
    
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :comment)
  end
end
