class DashboardController < ApplicationController
  def index
    @patients = Patient.joins(:transactions)
                       .select('patients.*, SUM(transactions.charge) - SUM(transactions.credit) AS outstanding_balance')
                       .group('patients.id')
                       .order('outstanding_balance DESC, MIN(transactions.date) ASC')
  end
end

