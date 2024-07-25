class TransactionsController < ApplicationController
 def new
   @transaction = Transaction.new
 end

 def create
   @transaction = Transaction.new(transaction_params)
   if @transaction.save
     redirect_to dashboard_path, notice: 'Payment recorded successfully.'
   else
     render :new
   end
 end

 private

 def transaction_params
   params.require(:transaction).permit(:patient_id, :charge, :credit, :date, :performed_by)
 end
end
