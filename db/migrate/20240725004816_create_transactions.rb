class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.references :patient, null: false, foreign_key: true
      t.string :procedure_code
      t.decimal :charge
      t.decimal :credit
      t.decimal :balance
      t.datetime :date
      t.string :performed_by

      t.timestamps
    end
  end
end

