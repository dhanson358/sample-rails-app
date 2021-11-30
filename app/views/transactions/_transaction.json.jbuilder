json.extract! transaction, :id, :cdt_code, :amount, :date, :performed_by, :patient_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
