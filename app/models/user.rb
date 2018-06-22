class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of :auth_token

  before_create :generate_authentication_token!

  #Entidades que usuário está relacionado
  has_many :contas, dependent: :destroy
  has_many :empresas, dependent: :destroy
  has_many :movimentos, dependent: :destroy
  has_many :movimento_contas, dependent: :destroy

  def info
    "#{email} - #{created_at} - Token: #{Devise.friendly_token}"
  end

  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while User.exists?(auth_token: auth_token)
  end
end
