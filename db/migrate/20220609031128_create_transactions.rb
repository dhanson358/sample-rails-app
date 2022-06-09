class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.integer :cdt_code
      t.float :amount
      t.datetime :date
      t.string :performed_by
      t.references :patient, foreign_key: true

      t.timestamps
    end
  end
end
#belongs_to patients
