class Saldo < ApplicationRecord
  validates_presence_of :data, :saldo
  # validates :data, :saldo, presence: true
end
