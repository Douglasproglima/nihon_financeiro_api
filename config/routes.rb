Rails.application.routes.draw do

  #Rotas referente há API, caso necessário criar um namespace separado para a área administrativa
  #Exemplo: namespace :admin do ... end

  #O namespace abaixo dará acesso externo da seguinte forma subdmonain.site.com/corpo_namespace
  # o path é necessário para acessar direto o subdomain, do contrário ficaria subdmonain.site.com/api/corpo_namespace
  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: "/" do

  end
end
