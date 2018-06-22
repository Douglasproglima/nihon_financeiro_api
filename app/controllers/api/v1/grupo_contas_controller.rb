class Api::V1::GrupoContasController < ApplicationController

  before_action :authenticate_with_token!
  respond_to :json

  def index
    grupo_contas = grupo_contas.all()
    render json: { grupo_contas: grupo_contas }, status: 200
    # render json: grupo_contas, status: 200
  end

  def show
    begin
      grupo_conta = GrupoConta.find(params[:id])
      # respond_with grupo_conta
      render json: grupo_conta, status: 200
    rescue
      head 404
    end
  end
end