class Api::UsersController < ApplicationController
  def index
    render json: User.all, each_serializer: UserSerializer
  end

  def show
    render json: User.find_by(id: params["id"])
  end
end
