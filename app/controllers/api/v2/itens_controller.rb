class Api::V2::ItensController < ApplicationController
  before_action :authenticate_with_token!
  respond_to :json

  def index
    itens = Item.all()
    render json: { itens: itens }, status: 200
  end

  def show
    begin
      item = Item.find(params[:id])
      render json: item, status: 200
    rescue
      head 404
    end
  end

  def create
    item = Item.new(item_params)

    if item.save
      render json: item, status: 201
    else
      render json: { errors: item.errors }, status: 422
    end
  end

  def update
    item = Item.find(params[:id])

    if item.update_attributes(item_params)
      render json: item, status: 200
    else
      render json: { errors: item.errors }, status: 422
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    head 204
  end

  private
  def item_params
    params.require(:item).permit(:nome, :referencia, :tipo, :subgrupo_id)
  end
end
