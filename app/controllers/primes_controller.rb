class PrimesController < ApplicationController
  skip_before_action :login_required

  # グラフの調整
  # /Users/nobu/Desktop/code/Rails/port_app/app/assets/javascripts/primes.coffee
  def index
    @result = []
    @rece = params[:digit] # 素数を算出したい数字受け取り
    
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

    # アクションと同じ名前のテンプレートを使うなら自動で読み込まれる。
    # render 'primes/index'

    # tips 他のアクションに値を渡す：paramsで直接渡す
    # @result = [2,6,56,23,5,4,67,7]
    # redirect_to action: :show, params: {'msg': @result}
  end

  def show
    # indexアクションからparamsハッシュで渡された値を使う
    # gon.data = params[:msg]
  end
end
