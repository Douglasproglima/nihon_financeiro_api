require 'rails_helper'

RSpec.describe Movimento, type: :model do
  let(:movimento) { build(:movimento) }

  context 'Quando for novo' do
    # it { expect(movimento).not_to be_done }
  end

  it { is_expected.to belong_to(:item) }
  it { is_expected.to belong_to(:conta) }
  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of :data }
  it { is_expected.to validate_presence_of :item_id }
  it { is_expected.to validate_presence_of :conta_id }
  it { is_expected.to validate_presence_of :user_id }

  it { is_expected.to respond_to(:data) }
  it { is_expected.to respond_to(:centro_custo) }
  it { is_expected.to respond_to(:valor) }
  it { is_expected.to respond_to(:observacao) }
  it { is_expected.to respond_to(:tipo) }

  it { is_expected.to respond_to(:item_id) }
  it { is_expected.to respond_to(:conta_id) }
  it { is_expected.to respond_to(:user_id) }
end
