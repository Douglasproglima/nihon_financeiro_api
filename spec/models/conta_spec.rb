require 'rails_helper'

RSpec.describe Conta, type: :model do
  let(:conta) { build(:conta) }

  context 'Quando for novo' do
    # it { expect(conta).not_to be_done }
  end

  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of :nome }
  it { is_expected.to validate_presence_of :user_id }

  it { is_expected.to respond_to(:nome) }
  it { is_expected.to respond_to(:numero) }
  it { is_expected.to respond_to(:agencia) }
  it { is_expected.to respond_to(:saldo) }
  it { is_expected.to respond_to(:saldo_inicial) }

  it { is_expected.to respond_to(:user_id) }
end
