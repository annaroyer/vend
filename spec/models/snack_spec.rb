require 'rails_helper'

describe Snack, type: :model do
  context 'relationships' do
    it { should have_many :machine_snacks }
    it { should have_many :machines }
  end

  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end
end
