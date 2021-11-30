class Transaction < ApplicationRecord
  belongs_to :patient
  belongs_to :transaction_code, foreign_key: 'cdt_code', class_name: 'TransactionCode'


  scope :filter_by_patient, -> (patient_id) { where("patient_id = ?", patient_id) }
  scope :payments , -> { where("cdt_code BETWEEN ? AND ?", 1, 4).order(date: :desc) }
  scope :unpaids, -> { where("cdt_code NOT BETWEEN ? AND ?", 1, 4).order(date: :desc) }
  scope :total_paid, -> { payments.sum(:amount) }
  scope :total_debt, -> { unpaids.sum(:amount) }

  scope :order_by_date_desc, -> { order(date: :desc) }
  scope :order_by_date_asc, -> {  order(date: :asc) }
  scope :last_payment, -> { payments.order(date: :desc).first }
  scope :last_charge, -> { unpaids.order(date: :desc).first }

  scope :outstanding_balance, -> { total_debt - total_paid }

end
