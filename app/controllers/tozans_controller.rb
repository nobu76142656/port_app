class TozansController < ApplicationController
  before_action :equ_user, only: [:edit, :update, :destroy]
  # 参考：Rails チュートリアル
  # before_action :logged_in_user, only: [:edit, :update]

  # Rails チュートリアル リスト 10.25: beforeフィルターを使って編集/更新ページを保護する

  def index
    @tozans = Tozan.all.order(created_at: :desc)
  end

  def show
    @tozan  = Tozan.find(params[:id])
  end

  def new
    @tozan = Tozan.new
  end

  def create
    @tozan = current_user.tozans.new(tozan_params)

    if @tozan.save
    # flash[:notice] = "登山記録「#{tozan.mountain}」を登録しました。" とも書ける
      redirect_to tozans_url, notice: "登山記録「#{@tozan.mountain}」を登録しました。"
    else
      render :new
    end
  end

  def edit
    # @tozan = Tozan.find(params[:id])
  end

  def update
    @tozan = Tozan.find(params[:id])
    @tozan.update!(tozan_params)
    redirect_to tozans_url, notice: "登山記録「#{@tozan.mountain}」を更新しました。"
  end

  def destroy
    # tozan = Tozan.find(params[:id])
    @tozan.destroy
    redirect_to tozans_url, notice: "登山記録「#{@tozan.mountain}」を削除しました"
  end


  private

  def tozan_params
    params.require(:tozan).permit(:mountain, :elevation, :content, :date, :image)
  end

  # 登山記録投稿者とedi・update・destroyを実行しようとしているのユーザーが同一かどうか確認
  def equ_user
    @tozan = Tozan.find(params[:id])
    unless @tozan.user.id == current_user.id
      flash[:notice] = "本人でなければできない操作です"
      redirect_to(root_path) 
    end
  end
end
