require 'api_version_constraint'

Rails.application.routes.draw do

  devise_for :users
  #Rotas referente há API, caso necessário criar um namespace separado para a área administrativa
  #Exemplo: namespace :admin do ... end

  #O namespace abaixo dará acesso externo da seguinte forma subdmonain.site.com/corpo_namespace
  #O path é necessário para acessar direto o subdomain, do contrário ficaria subdmonain.site.com/api/corpo_namespace

  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: "/" do

    #Na pasta lib contém o arquivo de controle de constraints da API que possui a class ApiVersionConstraint
    namespace :v1, path: "/", constraints: ApiVersionConstraint.new(version: 1, default: true) do
      #resources :contas_pagar
    end
  end

end
