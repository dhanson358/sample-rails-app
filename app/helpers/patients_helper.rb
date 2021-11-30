module PatientsHelper

  def in_debt_to_words(patient)
    return('$0') unless patient.is_in_debt?
    "$#{patient.transactions.outstanding_balance} "
  end

  def full_name(patient)
    "#{patient.first_name} #{patient.last_name}"
  end

end
