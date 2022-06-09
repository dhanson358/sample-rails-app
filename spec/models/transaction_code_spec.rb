require 'rails_helper'

RSpec.describe TransactionCode, type: :model do
  describe 'validations' do
    it { should validate_presence_of :entry_type }
    it { should validate_presence_of :title }
    # it { should validate_presence_of :cdt_code }
  end
end
