module BalancesHelper

  def last_payment_date_to_words(payment)
    payment.date.strftime('%d %B %Y')
  end

end
