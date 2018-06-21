class Api::V1::MovimentosController < ApplicationController
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
end
