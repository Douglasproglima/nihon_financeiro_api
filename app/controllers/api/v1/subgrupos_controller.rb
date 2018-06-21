class Api::V1::SubgruposController < ApplicationController
  respond_to :json

  def index
    subgrupos = subgrupos.findAll()
    render json: { subgrupos: subgrupos }, status: 200
  end

  def show
    begin
      @subgrupo = Subgrupo.find(params[:id])
      respond_with subgrupo
    rescue
      head 404
    end
  end
end
