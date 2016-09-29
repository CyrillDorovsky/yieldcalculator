require 'roo'
module History
  class << self
    def parse(file)
      @xlsx = Roo::Spreadsheet.open(file)
      @data = {
        total: parse_total,
        entities: parse_entities
      }
    end

    def load(file)
      parse(file)

      payment_pie=PaymentPie.create(expected_revenue: @data[:total][:optimistic], 
                                    real_revenue: @data[:total][:real])

      payments = @data[:entities].each_with_index.map do |data, entity_id|
        Payment.generate(payment_pie, entity_id, data)
      end

      investor_count = @data[:entities].count
      period = payments.flatten.count/investor_count
      deposite = @data[:entities].sum {|entity| entity[:sum]}

      Deposite.create(investor_id: 1, 
                      period: period,
                      payment_pie_id: payment_pie.id,
                      sum: deposite,
                      rate: payment_pie.expected_revenue)

      Payment.import(payments.flatten)
      payments
    end

    def parse_total
      real, optimistic = @xlsx.sheet(0).map do |row|
        JSON.parse(row.inspect)
      end.to_h.values
      { real: real, optimistic: optimistic }
    end

    def parse_entities
      entity_count = @xlsx.sheets.count - 1
      (1..entity_count).map do |entity_number| 
        { 
          sum: @xlsx.sheet(entity_number).row(2)[1],
          time: @xlsx.sheet(entity_number).row(3)[1],
          rate: @xlsx.sheet(entity_number).row(4)[1],
          period: @xlsx.sheet(entity_number).row(5)[1],
          delay_rate: @xlsx.sheet(entity_number).row(6)[1],
          month_debt: @xlsx.sheet(entity_number).row(8)[1],
          month_percent: @xlsx.sheet(entity_number).row(9)[1],
          total_month: @xlsx.sheet(entity_number).row(10)[1],
          pay_sum: @xlsx.sheet(entity_number).row(11)[1],
          payments: @xlsx.sheet(entity_number).row(15),
          paid_percent: @xlsx.sheet(entity_number).row(17)[1],
          paid_od: @xlsx.sheet(entity_number).row(18)[1],
          yield_per_annum: @xlsx.sheet(entity_number).row(19)[1],
        }
      end
    end
  end
end
