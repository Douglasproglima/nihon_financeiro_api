class GrupoConta < ApplicationRecord

  validates_presence_of :nome, :referencia
  # validates :nome, :referencia, presence: true
end
