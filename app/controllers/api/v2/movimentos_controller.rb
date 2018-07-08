class Api::V2::MovimentosController < ApplicationController

  before_action :authenticate_with_token!
  respond_to :json

  def index
    movimentos = current_user.movimentos
    render json: { movimentos: movimentos }, status: 200
  end

  def show
    movimento = current_user.movimentos.find(params[:id]) #Encontra os movimentos do usuário corrente
    render json: movimento, status: 200
  end

  def create
    # movimento = Movimento.new(user_id: current_user.id)
    movimento = current_user.movimentos.build(movimento_params)

    if movimento.save
      render json: movimento, status: 201
    else
      render json: { errors: movimento.errors }, status: 422
    end
  end

  private
  def movimento_params
    params.require(:movimento).permit(:data, :centro_custo, :valor, :observacao, :tipo, :item_id, :conta_id, :user_id)
  end
end
