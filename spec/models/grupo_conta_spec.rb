require 'rails_helper'

RSpec.describe GrupoConta, type: :model do
  let(:grupo_conta) { build(:grupo_conta) }

  # OBS: O destroy garante que ao excluir o grupo será excluido o subgrupo relacionado
  it { is_expected.to have_many(:subgrupos).dependent(:destroy) }

  context 'Quando for novo' do
    # it { expect(grupo_conta).not_to be_done }
  end

  it { is_expected.to validate_presence_of :nome }
  it { is_expected.to validate_presence_of :referencia }

  it { is_expected.to respond_to(:nome) }
  it { is_expected.to respond_to(:referencia) }
end
