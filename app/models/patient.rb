class Patient < ApplicationRecord
  has_many :transactions

  validates_presence_of :first_name, :last_name, :age, :gender
  validates_uniqueness_of :email, :phone_number

  enum gender: { "Male" => 0, "Female" => 1 }

  def self.largest_unpaid
    outstanding = Patient.all.select { |p| p.unpaid_balance != nil }
    outstanding.sort_by { |obj| obj.unpaid_balance }.reverse
  end

  def self.oldest_unpaid
    outstanding = Patient.all.select { |p| p.unpaid_balance != nil }
    patients = []
    outstanding.each do |obj|
      # obj.transactions.where("cdt_code > ?", 6).order(amount: :desc)
      # stopping point
    end
  end

  def unpaid_balance
    sum_paid = 0
    sum_unpaid = 0
    self.transactions.each do |t|
      if t.cdt_code > 6
        sum_unpaid += t.amount
      else
        sum_paid += t.amount
      end
    end

    diff = sum_unpaid - sum_paid
    if diff <= 0
      return nil
    else
      return diff
    end
  end
end
