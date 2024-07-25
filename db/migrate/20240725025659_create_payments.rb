class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.integer :patient_id
      t.decimal :charge
      t.decimal :credit
      t.datetime :date
      t.string :performed_by

      t.timestamps
    end
  end
end
