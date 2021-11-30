class CreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender, limit: 6
      t.integer :age
      t.string :email
      t.bigint :phone

      t.timestamps
    end
  end
end
