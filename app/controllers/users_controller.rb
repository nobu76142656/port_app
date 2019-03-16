class UsersController < ApplicationController
  # skip_before_action :login_required
  before_action :login_required, only: [:edit, :update, :destroy]
  before_action :equ_user, only: [:edit, :update, :destroy]

  # 参考：Rails チュートリアル
  # before_action :logged_in_user, only: [:edit, :update]

  # Rails チュートリアル リスト 10.25: beforeフィルターを使って編集/更新ページを保護する
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path, notice: "ユーザー「#{@user.name}」を登録しました"
    else
      render :new
    end
  end

  def edit
    # @user = User.find(params[:id])
  end

  def update
    # @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to user_path(@user), notice: "ユーザー「#{@user.name}」を更新しました。"
    else
      render :new
    end
  end

  def destroy
    # @user = User.find(params[:id])
    # destroy_allで紐つけられた投稿も削除する
    @user.tozans.destroy_all
    @user.destroy
    redirect_to users_url, notice: "ユーザー「#{@user.name}」を削除しました。"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # その投稿と同一のユーザーかどうか確認
  def equ_user
    @user = User.find(params[:id])
    unless @user == current_user
      flash[:notice] = "本人でなければできない操作です"
      redirect_to(users_path)
    end
  end
end
