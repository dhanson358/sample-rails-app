class TransactionCode < ApplicationRecord
  has_many :transactions, foreign_key: 'cdt_code', class_name: 'Transaction'

  scope :types_of_payments , -> { where("cdt_code BETWEEN ? AND ?", 1, 4).order(cdt_code: :asc) }

end
