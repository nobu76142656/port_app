class WordsController < ApplicationController
  skip_before_action :login_required

  def index
    @words = Word.all
  end

  def comparison
    # 入力された文字列とrandom()で生成されたidが一致するか
    if Word.find_by(id: params[:random], japanese: params[:answer])
      # 正解
      flash[:notice] = "正解！"
    else
      # 不正解
      flash[:notice] = "不正解"
    end
    redirect_to('/words/index')
  end

  def result

  end

  # 解答一覧
  def answer
    @words = Word.all
  end

  def timeMeasure
  end


end
