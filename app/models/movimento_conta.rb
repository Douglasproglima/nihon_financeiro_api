class MovimentoConta < ApplicationRecord
  belongs_to :conta
  belongs_to :user
  belongs_to :movimento

  validates_presence_of :data, :centro_custo, :valor, :saldo_anterior, :tipo, :conta_id, :user_id, :movimento_id
  # validates :data, :centro_custo, :valor, :saldo_anterior, :tipo, :conta_id, :user_id, :movimento_id presence: true
end