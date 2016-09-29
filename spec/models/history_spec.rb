require 'rails_helper'

RSpec.describe History do
  subject(:history) do
    History.parse(file)
  end

  describe 'parse' do
    let(:file) { "#{Rails.root}/spec/fixtures/history.xlsx" }

    it 'sheets is hash' do
      expect(subject.class).to eq(Hash)
    end

    it 'total is correct' do
      expect(subject[:total]).to eq({:real=>0.31111111111111106, :optimistic=>0.3})
    end

    it 'entities is correct' do
      expect(subject[:entities]).to eq([{:sum=>1000000, :time=>6, :rate=>0.3, :period=>1, :delay_rate=>0.5, :month_debt=>166666.66666666666, :month_percent=>25000, :total_month=>191666.66666666666, :pay_sum=>1150000, :payments=>[191666.66666666666, 191666.66666666666, 191666.66666666666, 191666.66666666666, 191666.66666666666, 191666.66666666666], :paid_percent=>150000, :paid_od=>1000000, :yield_per_annum=>0.3}, {:sum=>1000000, :time=>6, :rate=>0.3, :period=>1, :delay_rate=>0.5, :month_debt=>166666.66666666666, :month_percent=>25000, :total_month=>191666.66666666666, :pay_sum=>1150000, :payments=>[191666.66666666666, 191666.66666666666, 191666.66666666666, 525000.0, 0, 0], :paid_percent=>100000, :paid_od=>1000000, :yield_per_annum=>0.20000000000000004}, {:sum=>1000000, :time=>6, :rate=>0.3, :period=>1, :delay_rate=>0.5, :month_debt=>166666.66666666666, :month_percent=>25000, :total_month=>191666.66666666666, :pay_sum=>1150000, :payments=>[191666.66666666666, 191666.66666666666, 208333.3333333333, 208333.3333333333, 208333.3333333333, 208333.3333333333], :paid_percent=>216666.66666666666, :paid_od=>1000000, :yield_per_annum=>0.4333333333333333}])
    end
  end

end
