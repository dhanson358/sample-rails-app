require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'validations' do
    it { should validate_presence_of :cdt_code }
    it { should validate_presence_of :amount }
    it { should validate_presence_of :date }
    it { should validate_presence_of :performed_by }
    it { should validate_presence_of :patient_id }
  end

  describe 'relationships' do
    it { should belong_to :patient }
  end
end
