class Empresa < ApplicationRecord
  belongs_to :user

  validates_presence_of :nome, :telefone, :email, :cnpj, :contato, :ativo, :user_id
  # validates :nome, :telefone, :email, :cnpj, :contato, :ativo, :user_id presence: true
end