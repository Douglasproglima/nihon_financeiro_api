require 'rails_helper'

RSpec.describe 'Movimentos API' do

  #HOST's
  # before { host! 'api.nihon_financeiro.dev' } //Não está funcionando com esse host
  # before { host! 'api.nihon_financeiro.test' } //Não está funcionando com esse host
  before { host! 'api.localhost.dev' }

  let!(:user) { create(:user) }  #cria o usuário
  let(:headers) do
    {
        'Accept' => 'application/vnd.nihon_financeiro.v2',
        'Content-Type' => Mime[:json].to_s,
        'Authorization' => user.auth_token
    }
  end

  #Verbo GET
  describe 'GET /movimentos' do
    before do

      create_list(:movimento, 5, user_id: user.id)
      get '/movimentos', params: {}, headers: headers
    end

    #Os Testes
    it 'Retorna o código status: 200 OK' do
      expect(response).to have_http_status(200)
    end

    #espera que o json_body retorne 5 registros do banco de dados
    it 'Retorna os 5 movimentos criados do banco de dados' do
      expect(json_body[:movimentos].count).to eq(5)
    end
  end

  describe 'GET /movimentos/:id' do
    let(:movimento){ create(:movimento, user_id: user.id) }

    before { get "/movimentos/#{movimento.id}", params: {}, headers: headers }

    it 'Retorna o código status: 200 OK' do
      expect(response).to have_http_status(200)
    end

    #espera que o json_body com o movimento do banco de dados
    it 'Retorna o movimento em JSON' do
      expect(json_body[:centro_custo]).to eq(movimento.centro_custo)
    end
  end

  #Verbo POST
  describe 'POST /movimentos' do
    # before do
    #   post '/movimentos', params: { movimento: movimento_params }.to_json, headers: headers
    # end
    #
    # context 'Quando os parâmetros são válidos' do
    #
    #   let(:movimento_params) { attributes_for(:movimento) }
    #
    #   it 'Retorna o código status: 201 - Registro Criado' do
    #     expect(response).to have_http_status(201)
    #   end
    #
    #   it 'Salvar registro no banco de dados' do
    #     expect( Movimento.find_by(centro_custo: movimento_params[:centro_custo]) ).not_to be_nil #conta_params[:nome]).count ).to eq(1)
    #   end
    #
    #   it 'Retorna o JSON com o registro criado' do
    #     expect(json_body[:centro_custo]).to eq(movimento_params[:centro_custo])
    #   end
    #
    #   it 'Verifica se foi relacionado o usuário corrente a conta criada' do
    #     expect(json_body[:user_id]).to eq(user.id)
    #   end
    # end
    #
    # context 'Quando os parâmetros são inválidos' do
    #   let(:movimento_params) { attributes_for(:movimento, centro_custo: ' ') } #Passando o atributo nome vázio
    #
    #   it 'Retorna o código status: 422' do
    #     expect(response).to have_http_status(422)
    #   end
    #
    #   it 'Não foi salvo o registro no banco de dados' do
    #     expect( Movimento.find_by(centro_custo: movimento_params[:centro_custo]) ).to be_nil #Espera que seja null
    #   end
    #
    #   it 'Retornar o JSON com o erro referente ao atributo Nome' do
    #     # expect(json_body).to have_key(:errors) #Verifica se há erros no geral
    #
    #     #Verifica se há erro no array :errors referente ao atributo nome
    #     expect(json_body[:errors]).to have_key(:centro_custo)
    #
    #   end
    # end
  end

  #Verbo PUT
  describe 'PUT /contas' do

  end

  #Verbo DELETE
  describe 'DELETE /contas' do

  end
end