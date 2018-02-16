require 'rails_helper'

describe Machine, type: :model do
  context 'relationships' do
    it { should have_many :machine_snacks }
    it { should have_many :snacks }
  end
end
