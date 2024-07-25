class PaymentsController < ApplicationController
  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    if @payment.save
      update_patient_transactions(@payment)
      redirect_to root_path, notice: 'Payment successfully created.'
    else
      render :new
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:patient_id, :charge, :credit, :date, :performed_by)
  end

  def update_patient_transactions(payment)
    patient = payment.patient
    patient.transactions.create!(
      charge: payment.charge,
      credit: payment.credit,
      date: payment.date
    )
  end
end





