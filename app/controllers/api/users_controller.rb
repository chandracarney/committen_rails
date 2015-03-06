class Api::UsersController < ApplicationController
  def index
    render json: User.all, each_serializer: UserSerializer
  end

  def show
    render json: User.find_by(id: params["id"])
  end

  def update
    render json: User.update(params[:id], item_params)
  end

  private

  def item_params
    params.require(:user).permit(:name, :email, :twitter)
  end
end
