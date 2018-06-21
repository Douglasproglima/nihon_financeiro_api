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
end
