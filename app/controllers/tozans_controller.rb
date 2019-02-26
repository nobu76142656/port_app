class TozansController < ApplicationController
  def index
    @tozans = Tozan.all
  end

  def show
    @tozan  = Tozan.find(params[:id])
  end

  def new
    @tozan = Tozan.new
  end

  def create
    @tozan = Tozan.new(tozan_params)
    if @tozan.save
    # flash[:notece] = "登山記録「#{tozan.mountain}」を登録しました。" とも書ける
      redirect_to tozans_url, notice: "登山記録「#{tozan.mountain}」を登録しました。"
    else
      render :new
    end
  end

  def edit
    @tozan = Tozan.find(params[:id])
  end

  def update
    tozan = Tozan.find(params[:id])
    tozan.update!(tozan_params)
    redirect_to tozans_url, notice: "登山記録「#{tozan.mountain}」を更新しました。"
  end

  def destroy
    tozan = Tozan.find(params[:id])
    tozan.destroy
    redirect_to tozans_url, notice: "登山記録「#{tozan.mountain}」を削除しました"
  end


  private

  def tozan_params
    params.require(:tozan).permit(:mountain, :elevation, :content, :date, :image)
  end
end
