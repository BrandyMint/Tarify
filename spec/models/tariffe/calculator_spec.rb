require 'spec_helper'

describe Tariffe::Calculator do
  context 'with defaults' do
    subject { Tariffe::Calculator.new }

    # it { expect(subject.amount_of_invoices).to eq(0) }
    # it { expect(subject.household_fee).to eq(0.0) }
    it { expect(subject.sort_order).to eq('asc') }
    it { expect(subject.sort_field).to eq('total') }
    it { expect(subject.reverse_order).to eq('desc') }
    it { expect(subject.asc?).to be_true }
    it { expect(subject.params_order).to eq({ tariffe_calculator: { sort_order: 'desc', sort_field: 'total' } }.with_indifferent_access) }
    it { expect(subject.filled?).to be_false }
  end

  context 'with data' do
    subject { Tariffe::Calculator.new(amount_of_invoices: 10, household_fee: 100.0, sort_order: 'desc', sort_field: 'title') }

    it { expect(subject.sort_order).to eq('desc') }
    it { expect(subject.reverse_order).to eq('asc') }
    it { expect(subject.asc?).to be_false }
    it { expect(subject.params_order).to eq({ tariffe_calculator: { sort_order: 'asc', sort_field: 'title' } }.with_indifferent_access) }
    it { expect(subject.filled?).to be_true }
  end
end
