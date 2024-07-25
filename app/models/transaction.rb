class Transaction < ApplicationRecord
 belongs_to :patient

 validates :patient, presence: true
 validates :charge, numericality: { greater_than_or_equal_to: 0 }
 validates :credit, numericality: { greater_than_or_equal_to: 0 }
 validates :date, presence: true
end
