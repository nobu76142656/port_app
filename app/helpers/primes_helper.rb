module PrimesHelper

  # 2からその数未満で割る。全て割り切れなかったらそのnumが素数。
  def prime(arg)
    temp = 0
    (2..arg).each do |v|
      if arg % v == 0
        temp += 1
      end
    end
    
    ar = []
    if temp == 1
      ar = arg
    end
  end

end
