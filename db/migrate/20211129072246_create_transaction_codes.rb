class CreateTransactionCodes < ActiveRecord::Migration[6.1]
  def change
    create_table :transaction_codes do |t|
      t.string :entry_type, limit: 10
      t.string :title
      t.string :description
      t.integer :cdt_code
      t.timestamps
    end
  end
end
