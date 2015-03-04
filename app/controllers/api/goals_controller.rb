class Api::GoalsController < ApplicationController
  def index
    render json: Goal.all
  end

  def show
    render json: Goal.find_by(id: params["id"])
  end
end
