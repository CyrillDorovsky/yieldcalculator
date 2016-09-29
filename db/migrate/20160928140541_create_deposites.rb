class CreateDeposites < ActiveRecord::Migration[5.0]
  def change
    create_table :deposites do |t|
      t.integer :investor_id
      t.integer :period
      t.integer :payment_pie_id
      t.float :sum

      t.timestamps
    end
  end
end
