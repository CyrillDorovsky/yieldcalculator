class HomeController < ApplicationController
  def index
    @deposite = Deposite.last
    @calculate_deposite = Deposite.new
    @payment_pie = @deposite.payment_pie
    @payments = @payment_pie.payments
    @entities = @payments.pluck(:entity_id).uniq
    @first_ul_payments = Payment.where( payment_pie_id: @payment_pie.id, entity_id: 1 )
    @second_ul_payments = Payment.where( payment_pie_id: @payment_pie.id, entity_id: 2 )
    @third_ul_payments = Payment.where( payment_pie_id: @payment_pie.id, entity_id: 3 )
    @fourth_ul_payments = Payment.where( payment_pie_id: @payment_pie.id, entity_id: 4 )
  end

  def calculate
  end
end
