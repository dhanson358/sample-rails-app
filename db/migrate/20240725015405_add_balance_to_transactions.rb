class AddBalanceToTransactions < ActiveRecord::Migration[7.1]
  def change
    add_column :transactions, :balance, :decimal
  end
end
