require 'rails_helper'

RSpec.describe Patient, type: :model do

  describe 'validations' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :gender }
    it { should validate_uniqueness_of :phone_number }
    it { should validate_uniqueness_of :email }
  end

  describe 'relationships' do
    it { should have_many :transactions }
  end
end
