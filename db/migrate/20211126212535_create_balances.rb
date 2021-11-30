class CreateBalances < ActiveRecord::Migration[6.1]
  def change
    create_table :balances do |t|
      t.references :patient, null: false, foreign_key: true
      t.float :balance

      t.timestamps
    end
  end
end
