class Payment < ApplicationRecord
  belongs_to :payment_pie

  def self.investors_count
    pluck(:entity_id).uniq.count
  end

  def self.generate( payment_pie, entity_id, data = {})
    data[:payments].each_with_index.map do |paid_sum, month| 
      Payment.new( sum: paid_sum, 
                   entity_id: (entity_id + 1), 
                   month: (month + 1), 
                   investor_id: 1,
                   total_month: data[:total_month],
                   payment_pie_id: payment_pie.id
                 )
    end
  end

end
