class GrupoConta < ApplicationRecord

  validates_presence_of :nome, :referencia
  # validates :nome, :referencia, presence: true

  #Entidades que 'Grupo Conta' está relacionado
  has_many :subgrupos, dependent: :destroy
end
