class UsersController < ApplicationController
  before_action :set_user , only:[:show,:update,:edit]
  before_action :logged_in_user, only:[:index,:edit,:update,:following,:followers,:destroy] #:logged_in_user,:correct_userはApplicationControllerに記載
  before_action :correct_user , only:[:edit,:update]
  before_action :admin_user,     only: :destroy
  
  def index
      @users = User.paginate(page: params[:page])
  end
  
  def show #追加
  
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
    
  end 
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user #ここを修正
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following_users.paginate(page: params[:page])
    render "show_follow"
  end
  
  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.follower_users.paginate(page: params[:page])
    render "show_follow"
  end
  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :age,:area)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
  
   # 管理者かどうか確認
  def admin_user
      redirect_to(root_url) unless current_user.admin?
  end
end
