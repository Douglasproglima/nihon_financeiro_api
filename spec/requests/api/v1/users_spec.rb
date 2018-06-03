require 'rails_helper'

RSpec.describe 'Usuários da API', type: :request do
  #OS TESTES REALIZADOS NESSA ETAPA SÃO NO BANCO DE DADOS.

  let!(:user){ create(:user) }
  let(:user_id){ user.id }

  before { host! 'api.localhost.test' }
  # before { host! "api.nihon_financeiro.test" }

  #Método GET
  describe 'GET /users/:id' do
    before do
      headers = { 'Accept' => 'application/vnd.nihon_financeiro.v1' }
      get "/users/#{user_id}", params: {}, headers: headers
    end

    context 'Quando o usuário não existir' do
      it 'Retorna o usuário' do
        user_response = JSON.parse(response.body)
        expect(user_response["id"]).to eq(user_id)
      end

      it 'Retorna o código status: 200 OK' do
        expect(response).to have_http_status(200)
      end

      it 'Quando o usuário não existir' do
        let(:user_id) {1000}
      end

      it 'Retorna o código status: 404 ERROR' do
        expect(response).to have_http_status(404)
      end
    end
  end

  #Método POST
  describe 'POST /users' do
    before do
      headers = { 'Accept' => 'application/vnd.nihon_financeiro.v1' }
      post '/users', params: { user: user_params }, headers: headers
    end

    context 'Quando a requisição passando parâmetros é válida' do
      let(:user_params){FactoryGirl.attributes_for(:user)}

      it 'Retorna o código status: 201' do
        expect(response).to have_http_status(201)
      end

      it 'Retorna JSON com os dados do usuário criado' do
        user_response = JSON.parse(response.body)

        expect(user_response['email']).to eq(user_params[:email])
      end
    end

    context 'Quando a requisição passando parâmetros é invalida' do
      let(:user_params) { attributes_for(:user, email: 'email_invalido@') }

      it 'Retorna o código status: 422 ERRO' do
        user_response = JSON.parse(response.body)
        expect(user_response).to have_key('errors')
      end
    end
  end

end