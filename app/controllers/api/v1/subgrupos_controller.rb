class Api::V1::SubgruposController < ApplicationController
  before_action :authenticate_with_token!
  respond_to :json

  def index
    subgrupos = Subgrupo.all()
    render json: { subgrupos: subgrupos }, status: 200
  end

  def show
    begin
      subgrupo = Subgrupo.find(params[:id])
      render json: subgrupo, status: 200
    rescue
      head 404
    end
  end

  def create
    subgrupo = Subgrupo.new(subgrupo_params)

    if subgrupo.save
      render json: subgrupo, status: 201
    else
      render json: { errors: subgrupo.errors }, status: 422
    end
  end

  def update
    subgrupo = Subgrupo.find(params[:id])

    if subgrupo.update_attributes(subgrupo_params)
      render json: subgrupo, status: 200
    else
      render json: { errors: subgrupo.errors }, status: 422
    end
  end

  private
  def subgrupo_params
    params.require(:subgrupo).permit(:nome, :grupo_conta_id)
  end
end
