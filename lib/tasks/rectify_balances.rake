desc "Rectify and update the balances of all users by hand"

task :rectify_balances => :environment do
  patients = Patient.all
  patients.each do |patient|
    outstanding_balance = patient.transactions.outstanding_balance
    patient_balance = Balance.find_by_patient_id(patient.id)
    patient_balance ||= Balance.create!(patient_id: patient.id,
                                       balance: outstanding_balance)

    # In this case someone is creating transacion record and
    # forgeting to update the Balance table for the specific patient
    unless patient_balance.balance.eql?(outstanding_balance)
      patient_balance.update!(balance: outstanding_balance)
      p "Balance updated for patient with ID: #{patient.id}"
      p "Balance updated for patient with ID: #{patient.id}"
    end
  end

end