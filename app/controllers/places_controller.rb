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

  def jzip
    @jzip = Jzip.find_by(id: params[:address])
    @place = @jzip.pref
  end

  def malti_places
    @jzip_random = []
    5.times do
      @jzip_random << random_send
    end
    render :create

  end

  def create
    # {"id":1,"lat":35.4436739,"lng":139.6379639,"created_at":"2019-04-13T03:46:16.116Z","updated_at":"2019-04-13T03:46:16.116Z","address":"横浜市"}
    
    jzip_random = []
    params[:times].to_i.times do
      jzip_random << random_send
    end

    jzip_random.length.times do |i|
      params[:id] = jzip_random[i]
      @jzip = Jzip.find_by(id: params[:id])
      # <Jzip id: 58828, code: "3850012", pref: "長野県", city: "佐久市", address: "根々井", created_at: "2019-04-13 01:59:21", updated_at: "2019-04-13 01:59:21">
      ad_hash = Hash.new
      # hash = {R: "Ruby", P: "Perl"}
      ad_hash_st = @jzip.pref + @jzip.city + @jzip.address
      ad_hash = {address: ad_hash_st}

      @place = Place.new(ad_hash)
      # @place = Place.new({"address":"横浜市"})

      if @place.save
        flash[:notice] = "場所情報を「#{@place.address}」を登録しました"
      else
        render :new
      end
    end
    redirect_to '/places/index'
  end

  def destroy
    Place.find(params[:id]).destroy
    # flash[:notice] = "場所情報を「#{@place.address}」を削除しました"
    redirect_to places_url
  end
  
  def destroy_all
    Place.destroy_all
    redirect_to places_url
  end

  private

  def place_params
    params.require(:place).permit(:lat, :lng, :address)
    # params.require(:place).permit(:address)
  end
end
