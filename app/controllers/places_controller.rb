class PlacesController < ApplicationController
  skip_before_action :login_required
  include PlacesHelper

  def index
    @place = Place.new
    @places = Place.all
    @jzip = Jzip.find_by(id: params[:random_id])
  end

  def show
  end

  def new
    @place = Place.new
  end


  def create
     # ランダムの数字を受け取り地域名にし@place.addressにはできている。saveがされないlat,lng情報がない。
    @place = Jzip.find_by(id: params[:address])

    # @jzip = Jzip.find_by(id: params[:address])
    # @place = Place.new(@jzip)
    # @place = Place.new(place_params)

    if @place.save
      flash[:notice] = "場所情報を「#{@place.address}」を登録しました"
      redirect_to '/places/index'
    else
      render :new
    end
  end

  def destroy
    Place.find(params[:id]).destroy
    # flash[:notice] = "場所情報を「#{@place.address}」を削除しました"
    redirect_to places_url
  end

  private

  def place_params
    params.require(:place).permit(:lat, :lng, :address)
    # params.require(:place).permit(:address)
  end
end
