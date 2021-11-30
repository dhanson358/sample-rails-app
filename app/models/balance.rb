class Balance < ApplicationRecord
  belongs_to :patient

  scope :debtors, -> { where("balance > 0") }
  scope :order_by_balance_asc, -> { order(balance: :asc) }
  scope :order_by_balance_desc, -> { order(balance: :desc) }

  def self.oldest_unpaid_balance
    to_sort = debtors.pluck(:patient_id)
    patients_to_sort = Patient.where(id: to_sort)
    #patients_to_sort.map(&:last_charge).pluck(:date).sort.reverse!
    sorted = patients_to_sort.map(&:last_charge)
                             .pluck(:date, :patient_id)
                             .sort_by{|x| x[0]}
                             .reverse!
    sorted.map {|x| Balance.where(patient_id: x[1]).first }
  end

end
