require 'rails_helper'

RSpec.describe Subgrupo, type: :model do
  let(:subgrupo) { build(:subgrupo) }

  context 'Quando for novo' do
    # it { expect(subgrupo).not_to be_done }
  end

  it { is_expected.to belong_to(:grupo_conta) }

  it { is_expected.to validate_presence_of :nome }
  it { is_expected.to validate_presence_of :grupo_conta_id }

  it { is_expected.to respond_to(:nome) }
  it { is_expected.to respond_to(:referencia) }

  it { is_expected.to respond_to(:grupo_conta_id) }
end
