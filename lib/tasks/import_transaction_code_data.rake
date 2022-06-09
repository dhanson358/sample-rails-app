require 'csv'

TRANSACTION_CODE = "sample_data/transaction_codes.csv"

task :import_transaction_code_data => :environment do
  CSV.foreach(TRANSACTION_CODE, headers: true) do |row|
    @data = row.to_h

    def entry_type
      if @data["entry_type"] == "Payment"
        return 1
      else
        return 0
      end
    end

    TransactionCode.create(entry_type: @data["entry_type"],
                       title: @data["title"],
                       cdt_code: @data["cdt_code"],
                       description: @data["description By"])
  end
end
