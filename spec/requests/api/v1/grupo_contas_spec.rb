require 'rails_helper'

RSpec.describe 'Grupo Contas da API', type: :request do

  let!(:grupo_conta) { create(:grupo_conta) }
  let(:grupo_conta_id) { grupo_conta.id }
  let(:headers) do
    {
        'Accept' => 'application/vnd.nihon_financeiro.v1',
        'Content-Type' => Mime[:json].to_s
        # 'Authorization' => user.auth_token
    }
  end

  #HOST's
  # before { host! 'api.nihon_financeiro.test' }
  before { host! 'api.localhost.test' }

  #Verbo GET
  describe 'GET /grupo_contas/:id' do
    before do
      get "/grupo_contas/#{grupo_conta_id}", params: {}, headers: headers
    end

    context 'Quando o grupo conta existir' do
      it 'Retorna o grupo conta' do
        expect(json_body[:id]).to eq(grupo_conta_id)
      end

      it 'Retorna o código status: 200 OK' do
        expect(response).to have_http_status(200)
      end
    end

    context 'Quando o grupo conta não existir' do
      let(:grupo_conta_id) {1000}

      it 'Retorna o código status: 404 ERRO' do
        expect(response).to have_http_status(404)
      end
    end
  end
end