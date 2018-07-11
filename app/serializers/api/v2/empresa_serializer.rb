class Api::V2::EmpresaSerializer < ActiveModel::Serializer
  attributes :id, :nome, :razao_social, :telefone, :telefone2, :email, :cnpj, :contato, :ativo, :user_id
end
