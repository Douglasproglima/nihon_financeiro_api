require 'rails_helper'

RSpec.describe 'Grupo Contas da API', type: :request do

  let(:headers) do
    {
        'Accept' => 'application/vnd.nihon_financeiro.v1',
        'Content-Type' => Mime[:json].to_s
        # 'Authorization' => user.auth_token
    }
  end

  #HOST's
  # before { host! 'api.nihon_financeiro.dev' }
  before { host! 'api.localhost.dev' }

  #Verbo GET
  describe 'GET /grupo_contas' do
    before do

      #create_list(:entidade, numero_registros_que_vao_ser_criados, entidade_relacionada linha 5)
      create_list(:grupo_conta, 5)
      get '/grupo_contas', params: {}, headers: headers
    end

    #Os Testes
    it 'Retorna o código status: 200 OK' do
      # expect(response).to have_http_status(200)
    end

    #espera que o json_body retorne 5 contas do banco de dados
    it 'Retorna os 5 grupos contas criados do banco de dados' do
      expect(json_body[:grupo_contas].count).to eq(5)
    end
  end

  describe 'GET /grupo_contas/:id' do
    # before do
    #   get "/grupo_contas/#{grupo_conta_id}", params: {}, headers: headers
    # end
    #
    # context 'Quando o grupo conta existir' do
    #   it 'Retorna o grupo conta' do
    #     expect(json_body[:id]).to eq(grupo_conta_id)
    #   end
    #
    #   it 'Retorna o código status: 200 OK' do
    #     expect(response).to have_http_status(200)
    #   end
    # end
    #
    # context 'Quando o grupo conta não existir' do
    #   let(:grupo_conta_id) {1000}
    #
    #   it 'Retorna o código status: 404 ERRO' do
    #     expect(response).to have_http_status(404)
    #   end
    # end
  end
end