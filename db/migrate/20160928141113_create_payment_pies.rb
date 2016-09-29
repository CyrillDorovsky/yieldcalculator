class CreatePaymentPies < ActiveRecord::Migration[5.0]
  def change
    create_table :payment_pies do |t|
      t.float :expected_revenue
      t.float :real_revenue

      t.timestamps
    end
  end
end
