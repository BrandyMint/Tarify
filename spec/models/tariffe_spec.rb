require 'spec_helper'

describe Tariffe do
  let(:calculator) { Tariffe::Calculator.new(amount_of_invoices: 10, household_fee: 100.0) }

  context 'calculates monthly expenses' do
    describe '.with_total_calculation' do
      it do
        FactoryGirl.create(:tariffe)
        expect(Tariffe.with_total_calculation(calculator).first.total).to eq(1290.0)
      end
    end
  end
end
