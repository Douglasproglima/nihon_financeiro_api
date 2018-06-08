class Conta < ApplicationRecord
  belongs_to :user

  validates_presence_of :nome, :numero, :agencia, :saldo, :saldo_inicial, :user_id
  # validates :nome, :numero, :agencia, :saldo, :saldo_inicial, :user_id presence: true
end
