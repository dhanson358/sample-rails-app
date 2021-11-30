# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# We can improve a few things here
# Removing the CVS.parse
# We can be meta about this definitions (same pattern)
# it's just for example purposes only

require 'csv'

files = ['patients.csv', 'transaction_codes.csv', 'transactions.csv']
patients_file = File.read(Rails.root.join('sample_data', files[0]))
patients_parsed = CSV.parse(patients_file, :headers => true)

patiens_ready = patients_parsed.map do |row|
  {
    id: row["Patient ID"],
    first_name: row['First Name'],
    last_name: row['Last Name'],
    gender: row['Gender'],
    age: row['Age'],
    email: row['Email'],
    phone: row['Phone'].gsub('-',''),
    created_at: Time.now,
    updated_at: Time.now
  }
end
Patient.insert_all(patiens_ready, returning: %w[ id ])


trs_codes = File.read(Rails.root.join('sample_data', files[1]))
trs_codes_parsed = CSV.parse(trs_codes, :headers => true)

trs_codes_ready = trs_codes_parsed.map do |row|
  {
    entry_type: row["entry_type"],
    title: row["title"],
    cdt_code: row["cdt_code"],
    description: row["description"],
    created_at: Time.now,
    updated_at: Time.now
  }
end

TransactionCode.insert_all(trs_codes_ready, returning: %w[ id ])


trs = File.read(Rails.root.join('sample_data', files[2]))
trs_parsed = CSV.parse(trs, :headers => true)
trs_ready = trs_parsed.map do |row|
  {
    cdt_code: row["CDT Code"],
    patient_id: row["Patient ID"],
    amount: row['Amount'],
    date: row['Date'],
    performed_by: row["Performed By"],
    created_at: Time.now,
    updated_at: Time.now
  }
end

Transaction.insert_all(trs_ready, returning: %w[ id ])



