class TransactionCode < ApplicationRecord
  validates_presence_of :entry_type, :title

  enum entry_type: { "Procedure" => 0, "Payment" => 1 }
end
