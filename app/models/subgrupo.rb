class Subgrupo < ApplicationRecord
  belongs_to :grupo_conta


  validates_presence_of :nome, :grupo_conta_id
  # validates :nome, :grupo_conta_id, presence: true

  #Entidades que 'SubGrupo' está relacionado
  has_many :items, dependent: :destroy
end
