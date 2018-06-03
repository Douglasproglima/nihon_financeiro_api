require 'rails_helper'

RSpec.describe User, type: :model do
  #1 - Abaixo a primera implementação de testes realizados
  # before { @user = FactoryGirl.build(:user) }
  #
  # it { expect(@user).to respond_to(:email) }
  # it { expect(@user).to respond_to(:name) }
  # it { expect(@user).to respond_to(:password) }
  # it { expect(@user).to respond_to(:password_confirmation) }
  # it { expect(@user).to be_valid }

  #2 - Abaixo a segunda forma dos testes realizados
  #subject { FactoryGirl.build(:user) }
  #it { expect(subject).to respond_to(:email) }
  #it { expect(subject).to be_valid }

  #3 - Abaixo a tercceira forma dos testes realizados
  #it { is_expected.to respond_to(:email)}

  #4 - Abaixo a quarta forma dos testes realizados
  # let(:user) {FactoryGirl.build(:user)}
  # it { expect(user).to respond_to(:email) }
  #
  # context 'Teste: Quando o nome do usuário é branco' do
  #   before {user.name = " "}
  #
  #   it {expect(user).not_to be_valid}
  # end
  #
  # context 'Teste: Quando o nome do usuário for NULL' do
  #   before {user.name = nil}
  #
  #   it {expect(user).not_to be_valid}
  # end

  #5 - Abaixo a quinta forma dos testes realizados, a forma abaixo resume as anteriores com menos código
  let(:user) {FactoryGirl.build(:user)}

  #it { is_expected.to  validate_presence_of(:name)}
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  it { is_expected.to validate_confirmation_of(:password) }
  it { is_expected.to allow_value("admin@admin.com").for(:email) }
end