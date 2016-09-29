class Deposite < ApplicationRecord
  belongs_to :payment_pie
  def self.history
    #find_or_create_by( investor_id: 1, period: 6, sum: 3000000, rate: 30.0, payment_pie_id: 1 )
  end
end
