require 'csv'

TRANSACTIONS = "sample_data/transactions.csv"

task :import_transaction_data => :environment do
  CSV.foreach(TRANSACTIONS, headers: true) do |row|
    data = row.to_h

    Transaction.create(cdt_code: data["CDT Code"],
                       amount: data["Amount"],
                       date: data["Date"],
                       performed_by: data["Performed By"],
                       patient_id: data["Patient ID"])
  end
end
