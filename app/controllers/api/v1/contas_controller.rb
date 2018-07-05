class Api::V1::ContasController < ApplicationController

  before_action :authenticate_with_token!
  respond_to :json

  def index
    contas = current_user.contas
    render json: { contas: contas }, status: 200
  end

  def show
    conta = current_user.contas.find(params[:id]) #Encontra as contas do usuário corrente
    render json: conta, status: 200
  end

  def create
    # conta = Conta.new(user_id: current_user.id)
    conta = current_user.contas.build(conta_params)

    if conta.save
      render json: conta, status: 201
    else
      render json: { errors: conta.errors }, status: 422
    end
  end

  def update
    conta = current_user.contas.find(params[:id])

    if conta.update_attributes(conta_params)
      render json: conta, status: 200
    else
      render json: { errors: conta.errors }, status: 422
    end
  end

  def destroy
    conta = current_user.contas.find(params[:id])
    conta.destroy
    head 204
  end

  private
  def conta_params
    params.require(:conta).permit(:nome, :numero, :agencia, :saldo, :saldo_inicial)
  end
end
