class Item < ApplicationRecord
  belongs_to :subgrupo

  validates_presence_of :nome, :referencia, :tipo, :subgrupo_id
  # validates :nome, :referencia, :tipo, :subgrupo_id, presence: true
end
