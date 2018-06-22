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
end
