class DashboardController < ApplicationController

  def index
    @largest_unpaid = Patient.largest_unpaid
    @oldest_unpaid = Patient.oldest_unpaid
    require "pry"; binding.pry
  end

end
