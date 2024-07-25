class Patient < ApplicationRecord
 has_many :transactions

 def outstanding_balance
   transactions.sum(:charge) - transactions.sum(:credit)
 end

 def oldest_unpaid_transaction
   transactions.where("charge > credit").order(:date).first
 end
end


