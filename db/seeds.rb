# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



require 'csv'

# Clear existing data
Patient.delete_all
Transaction.delete_all

# Import patients
CSV.foreach(Rails.root.join('sample_data', 'patients.csv'), headers: true) do |row|
  Patient.create(
    id: row['Patient ID'].to_i,
    name: "#{row['First Name']} #{row['Last Name']}",
    contact_info: row['Phone']
  )
end

# Import transactions
CSV.foreach(Rails.root.join('sample_data', 'transactions.csv'), headers: true) do |row|
  Transaction.create(
    patient_id: row['Patient ID'].to_i,
    procedure_code: row['CDT Code'],
    charge: row['Amount'].to_f,
    credit: 0.00,  # Adjust if needed
    balance: row['Amount'].to_f,  # Adjust if needed
    date: row['Date'],
    performed_by: row['Performed By']
  )
end


