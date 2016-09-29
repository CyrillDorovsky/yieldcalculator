class AddColumnToDeposites < ActiveRecord::Migration[5.0]
  def change
    add_column :deposites, :rate, :float
  end
end
