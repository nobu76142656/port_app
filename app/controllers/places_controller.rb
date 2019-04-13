class PlacesController < ApplicationController
  skip_before_action :login_required
  include PlacesHelper

  def index
    @places = Place.all

    # jzipcode = JZipCode.new("jzipcode.db")
    # jzipcode.create("KEN_ALL.CSV")
    # @zip_r = jzipcode.find_by_code('1060031')
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
  end
end
