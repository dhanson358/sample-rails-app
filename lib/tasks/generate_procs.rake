desc "Generate some fake transaction data"
require 'csv'

FILENAME = "sample_data/transactions.csv"
HEADERS = ['Patient ID', 'CDT Code', 'Amount', 'Date', 'Performed By']
PROVIDERS = ['Dr. Smith', 'Cindy']

task :generate do
  procs = [
    {
      code: 1120,
      amount: 61.00
    },
    {
      code: 1206,
      amount: 85.00,
    },
    {
      code: 2330,
      amount: 45.00
    },
    {
      code: 6905,
      amount: 25.00
    },
    {
      code: 274,
      amount: 31.00
    },
    {
      code: 381,
      amount: 47.00
    },
    {
      code: 9973,
      amount: 12.00
    }
  ]

  pmt_amounts = [50.50, 37.50, 88.00, 12.75]

  payments = [1,2,3,4]

  start = 1.year.ago

  CSV.open(FILENAME, 'w', write_headers: true, headers: HEADERS) do |writer|

    (1..10).each do |patid|
      (1..10).each do |n|
        proc = procs.sample
        writer << [
          patid,
          proc[:code],
          proc[:amount],
          start + (2*n).week + rand(86400),
          PROVIDERS.sample
        ]
      end
      (1..5).each do |n|
        proc = procs.sample
        writer << [
          patid,
          payments.sample,
          pmt_amounts.sample,
          start + 5.weeks + (n.weeks) + rand(86400),
          ''
        ]
      end
    end
  end
end
