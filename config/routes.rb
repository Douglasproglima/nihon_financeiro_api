require 'api_version_constraint'

Rails.application.routes.draw do

  devise_for :users, only: [:sessions], controllers: { sessions: 'api/v1/sessions' }

  #Rotas referente há API, caso necessário criar um namespace separado para a área administrativa
  #Exemplo: namespace :admin do ... end

  #O namespace abaixo dará acesso externo da seguinte forma subdmonain.site.com/corpo_namespace
  #O path é necessário para acessar direto o subdomain, do contrário ficaria subdmonain.site.com/api/corpo_namespace
  namespace :api, default: { format: :json }, constraints: { subdomain: 'api' }, path: '/'  do

    #Na pasta lib contém o arquivo de controle de constraints da API que possui a class ApiVersionConstraint
    namespace :v1, path: '/', constraints: ApiVersionConstraint.new(version: 1, default: true) do

      #Define a rota para o controller User
      resources :users, only: [:show, :create, :update, :destroy]
      resources :sessions, only: [:create, :destroy]
      resources :contas, only: [:index, :show, :create, :update, :destroy]
      resources :empresas, only: [:index, :show, :create, :update, :destroy]
      resources :grupo_contas, only: [:index, :show, :create, :update, :destroy]
      resources :itens, only: [:index, :show, :create, :update, :destroy]
      resources :movimento_contas, only: [:index, :show, :create, :update, :destroy]
      resources :movimentos, only: [:index, :show, :create, :update, :destroy]
      resources :saldos, only: [:index, :show, :create, :update, :destroy]
      resources :subgrupos, only: [:index, :show, :create, :update, :destroy]
      # resources :tasks, only: [:index, :show, :create, :update, :destroy]
    end
  end

end
