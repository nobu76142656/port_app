class JzipsController < ApplicationController
  def index
  end
  def show
    @jzip = Jzip.find_by(id: params[:random_id])
  end
end
