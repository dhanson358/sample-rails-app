class TransactionCode < ApplicationRecord
  validates_presence_of :entry_type, :title, :cdt_code
  
end
