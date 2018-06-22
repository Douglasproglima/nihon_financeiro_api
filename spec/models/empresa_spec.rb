require 'rails_helper'

RSpec.describe Empresa, type: :model do
  let(:empresa) { FactoryGirl.build(:empresa) }

  context 'Quando for novo' do
    # it { expect(empresa).not_to be_done }
  end

  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of :nome }
  it { is_expected.to validate_presence_of :cnpj }
  it { is_expected.to validate_presence_of :telefone }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :user_id }

  it { is_expected.to respond_to(:nome) }
  it { is_expected.to respond_to(:telefone) }
  it { is_expected.to respond_to(:email) }
  it { is_expected.to respond_to(:cnpj) }
  it { is_expected.to respond_to(:contato) }
  it { is_expected.to respond_to(:ativo) }

  it { is_expected.to respond_to(:user_id) }
end
