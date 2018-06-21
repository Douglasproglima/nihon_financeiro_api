require 'rails_helper'

RSpec.describe 'Contas API' do

  #HOST's
  # before { host! 'api.nihon_financeiro.dev' } //Não está funcionando com esse host
  # before { host! 'api.nihon_financeiro.test' } //Não está funcionando com esse host
  before { host! 'api.localhost.dev' }

  let!(:user) { create(:user) }  #cria o usuário
  let(:headers) do
    {
        'Accept' => 'application/vnd.nihon_financeiro.v1',
        'Content-Type' => Mime[:json].to_s,
        'Authorization' => user.auth_token
    }
  end

  #Verbo GET
  describe 'GET /contas' do
    before do

      #create_list(:entidade, numero_registros_que_vao_ser_criados, entidade_relacionada linha 5)
      create_list(:conta, 5, user_id: user.id)
      get '/contas', params: {}, headers: headers
    end

    #Os Testes
    it 'Retorna o código status: 200 OK' do
      expect(response).to have_http_status(200)
    end

    #espera que o json_body retorne 5 contas do banco de dados
    it 'Retorna as 5 contas criadas do banco de dados' do
      expect(json_body[:contas].count).to eq(5)
    end
  end

  #Verbo POST
  describe 'POST /contas' do

  end

  #Verbo PUT
  describe 'PUT /contas' do

  end

  #Verbo DELETE
  describe 'DELETE /contas' do

  end
end