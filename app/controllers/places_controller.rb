class PlacesController < ApplicationController
  skip_before_action :login_required
  def index
    @places = Place.all
    # @plases = @places.to_json
  end

  def show
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)

    if @place.save
      flash[:notice] = "場所情報を「#{@place.name}」を登録しました"
      redirect_to '/places/index'
    else
      render :new
    end
  end

  def destroy
    Place.find(params[:id]).destroy
    flash[:success] = "場所の緯度経度情報を削除しました。"
    redirect_to "places/index"
  end

  private

  def place_params
    params.require(:place).permit(:name, :latitude, :longitude)
  end
end
