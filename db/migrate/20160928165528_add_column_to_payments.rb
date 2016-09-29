class AddColumnToPayments < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :payment_pie_id, :integer
  end
end
