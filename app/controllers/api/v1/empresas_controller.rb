class Api::V1::EmpresasController < ApplicationController

  before_action :authenticate_with_token!
  respond_to :json

  def index
    empresas = current_user.empresas
    render json: { empresas: empresas }, status: 200
  end

  def show
    empresa = current_user.empresas.find(params[:id]) #Encontra as empresas do usuário corrente
    render json: empresa, status: 200
  end

  def create
    empresa = current_user.empresas.build(empresa_params)

    if empresa.save
      render json: empresa, status: 201
    else
      render json: { errors: empresa.errors }, status: 422
    end
  end

  private
  def empresa_params
    params.require(:empresa).permit(:nome, :telefone, :email, :cnpj, :contato, :ativo, :user_id)
  end
end
