class PrimesController < ApplicationController
  skip_before_action :login_required
  def index
  end

  def calcu
    @result = []
    rece = params[:digit] # 数字受け取り
    
    rece.to_i.times do |x|
      @result << prime(x) # 受け取った数字までの素数を算出し配列に入れる
    end

    @result.compact! 

    render 'primes/index'
  end

  def show
  end

  private

  def primes_params
    params.require(:primes).permit(:digit)
  end
end
