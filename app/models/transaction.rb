class Transaction < ApplicationRecord
  belongs_to :patient

  validates_presence_of :cdt_code, :amount, :date, :patient_id

end
