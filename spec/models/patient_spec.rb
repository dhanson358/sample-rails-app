require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'associations' do
    it { should have_many(:transactions) }
  end

  describe 'outstanding_balance' do
    let(:patient) { create(:patient) }
    let!(:transaction1) { create(:transaction, patient: patient, charge: 100.0, credit: 20.0) }
    let!(:transaction2) { create(:transaction, patient: patient, charge: 200.0, credit: 50.0) }

    it 'calculates the correct outstanding balance' do
      expect(patient.outstanding_balance).to eq(230.0)
    end
  end

  describe 'oldest_unpaid_transaction' do
    let(:patient) { create(:patient) }
    let!(:transaction1) { create(:transaction, patient: patient, charge: 100.0, credit: 20.0, date: 2.days.ago) }
    let!(:transaction2) { create(:transaction, patient: patient, charge: 200.0, credit: 50.0, date: 1.day.ago) }

    it 'finds the oldest unpaid transaction' do
      expect(patient.oldest_unpaid_transaction).to eq(transaction1)
    end
  end
end
