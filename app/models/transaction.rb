class Transaction < ApplicationRecord
  belongs_to :patient

  validates_presence_of :cdt_code, :amount, :date, :patient_id

  def self.oldest_unpaid
    Transaction.where("cdt_code > ?", 6).order(date: :asc)
  end

  # def self.largest_unpaid
  #   Transaction.where("cdt_code > ?", 6).order(amount: :desc)
  # end
end
