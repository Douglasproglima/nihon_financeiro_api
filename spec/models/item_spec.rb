require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) { build(:item) }

  context 'Quando for novo' do
    # it { expect(item).not_to be_done }
  end

  it { is_expected.to belong_to(:subgrupo) }

  it { is_expected.to validate_presence_of :nome }
  it { is_expected.to validate_presence_of :subgrupo_id }

  it { is_expected.to respond_to(:nome) }
  it { is_expected.to respond_to(:referencia) }
  it { is_expected.to respond_to(:tipo) }

  it { is_expected.to respond_to(:subgrupo_id) }
end
