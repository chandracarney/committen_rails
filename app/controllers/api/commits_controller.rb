class Api::CommitsController < ApplicationController
  def index
    render json: Commit.all
  end

  def show
    render json: Commit.find_by(id: params["id"])
  end
end
