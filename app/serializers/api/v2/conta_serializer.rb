class Api::V2::ContaSerializer < ActiveModel::Serializer
  attributes :id, :nome, :numero, :agencia, :saldo, :saldo_inicial, :user_id,
             :short_nome, :is_valido

  def short_nome
    object.nome[0..5]
  end

  #Método para retornar um atributo virtual
  def is_valido
    Time.current > object.created_at if object.created_at.present?
  end


  #Retorna todos os atributos do User
  belongs_to :user
end
