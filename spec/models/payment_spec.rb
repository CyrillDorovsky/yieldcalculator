require 'rails_helper'

RSpec.describe Payment, type: :model do
  subject(:history) { History.load(file) }

  describe 'load from page' do
    let(:file) { "#{Rails.root}/spec/fixtures/history.xlsx" }

    it 'load to db' do
      p subject
    end
  end
end
