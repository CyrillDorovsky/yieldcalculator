class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.float :sum, null: false, default: 0
      t.integer :entity_id, null: false
      t.integer :month, null: false
      t.integer :investor_id, null: false
      t.float :total_month, null: false

      t.timestamps
    end
  end
end
