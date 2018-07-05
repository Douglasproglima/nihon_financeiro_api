class Api::V1::GrupoContasController < ApplicationController

  before_action :authenticate_with_token!
  respond_to :json

  def index
    grupo_contas = GrupoConta.all()
    render json: { grupo_contas: grupo_contas }, status: 200
  end

  def show
    begin
      grupo_conta = GrupoConta.find(params[:id])
      render json: grupo_conta, status: 200
    rescue
      head 404
    end
  end

  def create
    grupo_conta = GrupoConta.new(grupo_conta_params)

    if grupo_conta.save
      render json: grupo_conta, status: 201
    else
      render json: { errors: grupo_conta.errors }, status: 422
    end
  end

  def update
    grupo_conta = GrupoConta.find(params[:id])

    if grupo_conta.update_attributes(grupo_conta_params)
      render json: grupo_conta, status: 200
    else
      render json: { errors: grupo_conta.errors }, status: 422
    end
  end

  def destroy
    conta = GrupoConta.find(params[:id])
    conta.destroy
    head 204
  end

  private
  def grupo_conta_params
    params.require(:grupo_conta).permit(:nome, :referencia)
  end
end