require 'rails_helper'

RSpec.describe 'Item da API', type: :request do
  let!(:item) { create(:item) }
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
  describe 'GET /itens' do
    before do
      #create_list(:entidade, numero_registros_que_vao_ser_criados, entidade_relacionada linha 5)
      create_list(:item, 5)
      get '/itens', params: {}, headers: headers
    end

    #Os Testes
    it 'Retorna o código status: 200 OK' do
      expect(response).to have_http_status(200)
    end

    #espera que o json_body retorne 5 contas do banco de dados
    it 'Retorna os 5 itens criados do banco de dados' do
      expect(json_body[:itens].count).to eq(6)
    end
  end

  #Verbo GET /:id
  describe 'GET /itens/:id' do
    let(:item) { create(:item) }

    before do
      get "/itens/#{item.id}", params: {}, headers: headers
    end

    it 'Retorna o item' do
      expect(json_body[:nome]).to eq(item.nome)
    end

    it 'Retorna o código status: 200 OK' do
      expect(response).to have_http_status(200)
    end
  end

  #Verbo POST
  describe 'POST /itens' do
    before do
      post '/itens', params: { item: item_params }.to_json, headers: headers
    end

    context 'Quando os parâmetros são válidos' do

      let(:item_params) { attributes_for(:item) }

      it 'Retorna o código status: 201 - Registro Criado.' do
        expect(response).to have_http_status(201)
      end

      it 'Salvar registro no banco de dados' do
        # byebug
        expect( Item.find_by(nome: item_params[:nome])).not_to be_nil #item_params[:nome]).count ).to eq(1)
      end

      it 'Retorna o JSON com o registro criado' do
        # byebug
        expect(json_body[:nome]).to eq(item_params [:nome])
      end
    end

    context 'Quando os parâmetros são inválidos' do
      let(:item_params ) { attributes_for(:item, nome: ' ') } #Passando o atributo nome vázio

      it 'Retorna o código status: 422' do
        expect(response).to have_http_status(422)
      end

      it 'Não foi salvo o registro no banco de dados' do
        expect( Item.find_by(nome: item_params[:nome]) ).to be_nil #Espera que seja null
      end

      it 'Retornar o JSON com o erro referente ao atributo Nome' do
        # expect(json_body).to have_key(:errors) #Verifica se há erros no geral

        #Verifica se há erro no array :errors referente ao atributo nome
        expect(json_body[:errors]).to have_key(:nome)

      end
    end
  end

  #Verbo PUT
  describe 'PUT /itens' do
    let(:item) { create(:item) }

    before do
      put "/itens/#{item.id}", params: { item: item_params }.to_json, headers: headers
    end

    context 'Parâmetros válidos' do
      let(:item_params){{ nome: 'Novo Item' }}

      it 'Retorna o código status: 200 - Registro Criado' do
        expect(response).to have_http_status(200)
      end

      it 'Retorna o JSON com o registro atualizado' do
        expect(json_body[:nome]).to eq(item_params[:nome])
      end

      it 'Atualiza registro no banco de dados' do
        expect( Item.find_by(nome: item_params[:nome]) ).not_to be_nil
      end
    end

    context 'Parâmetros inválidos' do
      let(:item_params) { attributes_for(:item, nome: ' ') } #Passando o atributo nome vázio

      it 'Retorna o código status: 422' do
        expect(response).to have_http_status(422)
      end

      it 'Retornar o JSON com o erro referente ao atributo Nome' do
        expect(json_body[:errors]).to have_key(:nome)
      end

      it 'Não foi salvo o registro no banco de dados' do
        expect( Item.find_by(nome: item_params[:nome]) ).to be_nil #Espera que seja null
      end
    end
  end

  #Verbo DELETE
  describe 'DELETE /itens' do

  end
end