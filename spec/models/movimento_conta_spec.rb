require 'rails_helper'

RSpec.describe MovimentoConta, type: :model do
  let(:movimento_conta) { build(:movimento_conta) }

  context 'Quando for novo' do
    # it { expect(movimento_conta).not_to be_done }
  end

  it { is_expected.to belong_to(:conta) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:movimento) }

  it { is_expected.to validate_presence_of :data }
  it { is_expected.to validate_presence_of :conta_id }
  it { is_expected.to validate_presence_of :user_id }
  it { is_expected.to validate_presence_of :movimento_id }

  it { is_expected.to respond_to(:data) }
  it { is_expected.to respond_to(:centro_custo) }
  it { is_expected.to respond_to(:valor) }
  it { is_expected.to respond_to(:saldo_anterior) }
  it { is_expected.to respond_to(:tipo) }

  it { is_expected.to respond_to(:conta_id) }
  it { is_expected.to respond_to(:user_id) }
  it { is_expected.to respond_to(:movimento_id) }
end
