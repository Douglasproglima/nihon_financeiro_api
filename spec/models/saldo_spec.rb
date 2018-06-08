require 'rails_helper'

RSpec.describe Saldo, type: :model do
  let(:saldo) { build(:saldo) }

  context 'Quando for novo' do
    # it { expect(saldo).not_to be_done }
  end

  it { is_expected.to validate_presence_of :data }
  it { is_expected.to validate_presence_of :saldo }

  it { is_expected.to respond_to(:data) }
  it { is_expected.to respond_to(:saldo) }
end
