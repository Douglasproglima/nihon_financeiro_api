class Movimento < ApplicationRecord
  belongs_to :item
  belongs_to :conta
  belongs_to :user

  validates_presence_of :data, :centro_custo, :valor, :observacao, :tipo, :item_id, :conta_id, :user_id
  # validates :data, :centro_custo, :valor, :observacao, :tipo, :item_id, :conta_id, :user_id presence: true
end