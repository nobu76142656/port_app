class ApplicationController < ActionController::Base
  include PrimesHelper
  helper_method :current_user

  # アプリケーション内全てのアクションの処理まえに、ユーザーがログイン済みかどうかのチェック
  # が入る。
  before_action :login_required

  private

  # ログインしているユーザーを取得する
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  # ログイン済みでなければ、ログインページを表示する。編集・更新・削除ページにはいけない。
  def login_required
    unless current_user
      flash[:notice] = 'ログインしてください。'
      redirect_to login_path
    end
  end


end
