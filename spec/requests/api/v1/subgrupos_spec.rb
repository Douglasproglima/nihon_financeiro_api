require 'rails_helper'

RSpec.describe 'SubGrupo da API', type: :request do
  let!(:subgrupo) { create(:subgrupo) }
  # let!(:grupo_conta) { create(:grupo_conta) }
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
  describe 'GET /subgrupos' do
    before do
      #create_list(:entidade, numero_registros_que_vao_ser_criados, entidade_relacionada linha 5)
      create_list(:subgrupo, 5)
      get '/subgrupos', params: {}, headers: headers
    end

    #Os Testes
    it 'Retorna o código status: 200 OK' do
      expect(response).to have_http_status(200)
    end

    #espera que o json_body retorne 5 contas do banco de dados
    it 'Retorna os 5 grupos contas criados do banco de dados' do
      expect(json_body[:subgrupos].count).to eq(6)
    end
  end

  #Verbo GET /:id
  describe 'GET /subgrupos/:id' do
    let(:subgrupo) { create(:subgrupo) }

    before do
      get "/subgrupos/#{subgrupo.id}", params: {}, headers: headers
    end

    it 'Retorna o grupo conta' do
      expect(json_body[:nome]).to eq(subgrupo.nome)
    end

    it 'Retorna o código status: 200 OK' do
      expect(response).to have_http_status(200)
    end
  end

  #Verbo POST
  describe 'POST /subgrupos' do
    before do
      post '/subgrupos', params: { subgrupo: subgrupo_params }.to_json, headers: headers
    end

    context 'Quando os parâmetros são válidos' do

      let(:subgrupo_params) { attributes_for(:subgrupo) }

      it 'Retorna o código status: 201 - Registro Criado.' do
        expect(response).to have_http_status(201)
      end

      it 'Salvar registro no banco de dados' do
        byebug
        expect( Subgrupo.find_by(nome: subgrupo_params[:nome])).not_to be_nil #subgrupo_params[:nome]).count ).to eq(1)
      end

      it 'Retorna o JSON com o registro criado' do
        byebug
        expect(json_body[:nome, :grupo_conta_id]).to eq(subgrupo_params [:nome, :grupo_conta_id])
      end
    end

    context 'Quando os parâmetros são inválidos' do
      let(:subgrupo_params ) { attributes_for(:subgrupo, nome: ' ') } #Passando o atributo nome vázio

      it 'Retorna o código status: 422' do
        expect(response).to have_http_status(422)
      end

      it 'Não foi salvo o registro no banco de dados' do
        expect( Subgrupo.find_by(nome: subgrupo_params[:nome]) ).to be_nil #Espera que seja null
      end

      it 'Retornar o JSON com o erro referente ao atributo Nome' do
        # expect(json_body).to have_key(:errors) #Verifica se há erros no geral

        #Verifica se há erro no array :errors referente ao atributo nome
        expect(json_body[:errors]).to have_key(:nome)

      end
    end
  end

  #Verbo PUT
  describe 'PUT /subgrupos' do
    let(:subgrupo) { create(:subgrupo) }

    before do
      put "/subgrupos/#{subgrupo.id}", params: { subgrupo: subgrupo_params }.to_json, headers: headers
    end

    context 'Parâmetros válidos' do
      let(:subgrupo_params){{ nome: 'Novo SubGrupo' }}

      it 'Retorna o código status: 200 - Registro Criado' do
        expect(response).to have_http_status(200)
      end

      it 'Retorna o JSON com o registro atualizado' do
        expect(json_body[:nome]).to eq(subgrupo_params[:nome])
      end

      it 'Atualiza registro no banco de dados' do
        expect( Subgrupo.find_by(nome: subgrupo_params[:nome]) ).not_to be_nil
      end
    end

    context 'Parâmetros inválidos' do
      let(:subgrupo_params) { attributes_for(:subgrupo, nome: ' ') } #Passando o atributo nome vázio

      it 'Retorna o código status: 422' do
        expect(response).to have_http_status(422)
      end

      it 'Retornar o JSON com o erro referente ao atributo Nome' do
        expect(json_body[:errors]).to have_key(:nome)
      end

      it 'Não foi salvo o registro no banco de dados' do
        expect( Subgrupo.find_by(nome: subgrupo_params[:nome]) ).to be_nil #Espera que seja null
      end
    end
  end

  #Verbo DELETE
  describe 'DELETE /subgrupos' do

  end
end