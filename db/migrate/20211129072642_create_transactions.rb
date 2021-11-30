class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.float :amount
      t.string :performed_by
      t.datetime :date
      t.integer :cdt_code
      t.references :patient, null: false, foreign_key: true, unique: true

      t.timestamps
    end

  end
end
