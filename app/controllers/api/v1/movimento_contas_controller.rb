class Api::V1::MovimentoContasController < ApplicationController
  before_action :authenticate_with_token!
  respond_to :json

  def index
    movimento_contas = current_user.movimento_contas
    render json: { movimento_contas: movimento_contas }, status: 200
  end

  def show
    movimento_conta = current_user.movimento_contas.find(params[:id]) #Encontra os movimentosXContas do usuário corrente
    render json: movimento_conta, status: 200
  end
end