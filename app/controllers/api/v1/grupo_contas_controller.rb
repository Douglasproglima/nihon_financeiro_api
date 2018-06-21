class Api::V1::GrupoContasController < ApplicationController

  before_action :authenticate_with_token!
  respond_to :json

  def index
    grupo_contas = grupo_contas.findAll()
    render json: { grupo_contas: grupo_contas }, status: 200
  end

  def show
    begin
      @grupo_conta = GrupoConta.find(params[:id])
      respond_with @grupo_conta
    rescue
      head 404
    end
  end
end
