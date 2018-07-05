require 'rails_helper'

RSpec.describe 'Grupo Contas da API', type: :request do
  let!(:grupo_conta) { create(:grupo_conta) }
  let!(:user) { create(:user) }
  let(:headers) do
    {
        'Accept' => 'application/vnd.nihon_financeiro.v1',
        'Content-Type' => Mime[:json].to_s,
        'Authorization' => user.auth_token
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
      expect(response).to have_http_status(200)
    end

    #espera que o json_body retorne 5 contas do banco de dados
    it 'Retorna os 5 grupos contas criados do banco de dados' do
      expect(json_body[:grupo_contas].count).to eq(6)
    end
  end

  #Verbo GET /:id
  describe 'GET /grupo_contas/:id' do
    let(:grupo_conta) { create(:grupo_conta) }

    before do
      get "/grupo_contas/#{grupo_conta.id}", params: {}, headers: headers
    end

    it 'Retorna o grupo conta' do
      expect(json_body[:nome]).to eq(grupo_conta.nome)
    end

    it 'Retorna o código status: 200 OK' do
      expect(response).to have_http_status(200)
    end
  end

  #Verbo POST
  describe 'POST /grupo_contas' do
    before do
      post '/grupo_contas', params: { grupo_conta: grupo_conta_params }.to_json, headers: headers
    end

    context 'Quando os parâmetros são válidos' do

      let(:grupo_conta_params) { attributes_for(:grupo_conta) }

      it 'Retorna o código status: 201 - Registro Criado.' do
        expect(response).to have_http_status(201)
      end

      it 'Salvar registro no banco de dados' do
        expect( GrupoConta.find_by(nome: grupo_conta_params[:nome]) ).not_to be_nil #grupo_conta_params[:nome]).count ).to eq(1)
      end

      it 'Retorna o JSON com o registro criado' do
        expect(json_body[:nome]).to eq(grupo_conta_params[:nome])
      end
    end

    context 'Quando os parâmetros são inválidos' do
      let(:grupo_conta_params) { attributes_for(:grupo_conta, nome: ' ') } #Passando o atributo nome vázio

      it 'Retorna o código status: 422' do
        expect(response).to have_http_status(422)
      end

      it 'Não foi salvo o registro no banco de dados' do
        expect( GrupoConta.find_by(nome: grupo_conta_params[:nome]) ).to be_nil #Espera que seja null
      end

      it 'Retornar o JSON com o erro referente ao atributo Nome' do
        # expect(json_body).to have_key(:errors) #Verifica se há erros no geral

        #Verifica se há erro no array :errors referente ao atributo nome
        expect(json_body[:errors]).to have_key(:nome)

      end
    end
  end

  #Verbo PUT
  describe 'PUT /grupo_contas' do
    let(:grupo_conta) { create(:grupo_conta) }

    before do
      put "/grupo_contas/#{grupo_conta.id}", params: { grupo_conta: grupo_conta_params }.to_json, headers: headers
    end

    context 'Parâmetros válidos' do
      let(:grupo_conta_params){{ nome: 'Novo Grupo Conta' }}

      it 'Retorna o código status: 200 - Registro Criado' do
        expect(response).to have_http_status(200)
      end

      it 'Retorna o JSON com o registro atualizado' do
        expect(json_body[:nome]).to eq(grupo_conta_params[:nome])
      end

      it 'Atualiza registro no banco de dados' do
        expect( GrupoConta.find_by(nome: grupo_conta_params[:nome]) ).not_to be_nil
      end
    end

    context 'Parâmetros inválidos' do
      let(:grupo_conta_params) { attributes_for(:conta, nome: ' ') } #Passando o atributo nome vázio

      it 'Retorna o código status: 422' do
        expect(response).to have_http_status(422)
      end

      it 'Retornar o JSON com o erro referente ao atributo Nome' do
        expect(json_body[:errors]).to have_key(:nome)
      end

      it 'Não foi salvo o registro no banco de dados' do
        expect( GrupoConta.find_by(nome: grupo_conta_params[:nome]) ).to be_nil #Espera que seja null
      end
    end
  end

  #Verbo DELETE
  describe 'DELETE /grupo_contas' do
    let!(:grupo_conta) { create(:grupo_conta) }

    before do
      delete "/grupo_contas/#{grupo_conta.id}", params: { }, headers: headers
    end

    it 'Retorna o código status: 204 - Registro Removido' do
      expect(response).to have_http_status(204)
    end

    it 'Remove o registro do banco de dados' do
      expect { GrupoConta.find(grupo_conta.id) }.to raise_error(ActiveRecord::RecordNotFound)
      # expect { GrupoConta.find_by(id: grupo_conta.id).to be_nil
    end
  end
end