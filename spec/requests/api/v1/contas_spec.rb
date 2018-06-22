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

  describe 'GET /contas/:id' do
    let(:conta){ create(:conta, user_id: user.id) }

    before { get "/contas/#{conta.id}", params: {}, headers: headers }

    it 'Retorna o código status: 200 OK' do
      expect(response).to have_http_status(200)
    end

    #espera que o json_body com a conta do banco de dados
    it 'Retorna a conta em JSON' do
      expect(json_body[:nome]).to eq(conta.nome)
    end
  end

  #Verbo POST
  describe 'POST /contas' do
    before do
      post '/contas', params: { conta: conta_params }.to_json, headers: headers
    end

    context 'Quando os parâmetros são válidos' do

      let(:conta_params) { attributes_for(:conta) }

      it 'Retorna o código status: 201 - Registro Criado' do
        expect(response).to have_http_status(201)
      end

      it 'Salvar registro no banco de dados' do
        expect( Conta.find_by(nome: conta_params[:nome]) ).not_to be_nil #conta_params[:nome]).count ).to eq(1)
      end

      it 'Retorna o JSON com o registro criado' do
        expect(json_body[:nome]).to eq(conta_params[:nome])
      end

      it 'Verifica se foi relacionado o usuário corrente a conta criada' do
        expect(json_body[:user_id]).to eq(user.id)
      end
    end

    context 'Quando os parâmetros são inválidos' do
      let(:conta_params) { attributes_for(:conta, nome: ' ') } #Passando o atributo nome vázio

      it 'Retorna o código status: 422' do
        expect(response).to have_http_status(422)
      end

      it 'Não foi salvo o registro no banco de dados' do
        expect( Conta.find_by(nome: conta_params[:nome]) ).to be_nil #Espera que seja null
      end

      it 'Retornar o JSON com o erro referente ao atributo Nome' do
        # expect(json_body).to have_key(:errors) #Verifica se há erros no geral

        #Verifica se há erro no array :errors referente ao atributo nome
        expect(json_body[:errors]).to have_key(:nome)

      end
    end
  end

  #Verbo PUT
  describe 'PUT /contas' do

  end

  #Verbo DELETE
  describe 'DELETE /contas' do

  end
end