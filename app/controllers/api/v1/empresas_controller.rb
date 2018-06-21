class Api::V1::EmpresasController < ApplicationController

  before_action :authenticate_with_token!
  respond_to :json

  def index
    empresas = current_user.empresas

    render json: { empresas: empresas }, status: 200
  end
end
