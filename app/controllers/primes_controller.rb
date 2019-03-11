class PrimesController < ApplicationController
  skip_before_action :login_required

  def index
    @result = []
    @rece = params[:digit] # 数字受け取り
    
    @rece.to_i.times do |x|
      @result << prime(x) # 受け取った数字までの素数を算出し配列に入れる
    end

    # @result.compact! # 配列のnilを削除

    # 素数配列をnづつに分ける(ここでは30)
    temp = []
    @result.each_slice(30) do |i|
      temp << i
    end

    # n毎にいくつ素数が入っているか数える
    r1 = 0
    r2 = []
    temp.each do |i|
      i.each do |j|
        if j
          r1 += 1
        end
      end
      r2 << r1
      r1 = 0
    end
    gon.data = r2


    render 'primes/index'
  end

  def show
  end
end
