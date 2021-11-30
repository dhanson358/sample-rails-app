class Patient < ApplicationRecord
  has_many :transactions
  has_one :balance

  def last_payment
    transactions.last_payment
  end

  def last_charge
    transactions.last_charge
  end

  def is_in_debt?
    outstanding_balance = transactions.outstanding_balance
    # To be explicit
    return(false) if outstanding_balance&.negative? # When the patient pays more than owes
    return(false) if outstanding_balance&.eql?(0) # When the total payments and unpaids are equal, no debt!
    return(false) if outstanding_balance&.nil? ||
                     outstanding_balance&.eql?('null') ||
                     outstanding_balance&.eql?('')
    true # When the outstanding_balance its positive
  end

end
