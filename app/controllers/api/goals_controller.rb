class Api::GoalsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    render json: Goal.all
  end

  def show
    render json: Goal.find_by(id: params["id"])
  end

  def create
    render json: Goal.create(goal_params)
  end

  def update
    render json: Goal.update(params[:id], goal_params)
  end

  private

  def goal_params
    params.require(:goal).permit(:user_id, :title, :description,
                                 :start_date, :end_date,
                                 :daily_quantity, :completed)
  end
end
