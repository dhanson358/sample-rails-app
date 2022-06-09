class CreateTransactionCodes < ActiveRecord::Migration[6.1]
  def change
    create_table :transaction_codes do |t|
      t.integer :entry_type
      t.string :title
      t.integer :cdt_code
      t.text :description

      t.timestamps
    end
  end
end
