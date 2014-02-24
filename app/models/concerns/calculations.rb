module Concerns::Calculations
  extend ActiveSupport::Concern

  module ClassMethods
    # Aggregate sum of monthly expences
    #
    # ==== Attributes
    #
    # * +amount_of_invoices+ - Number of invoices
    # * +household_fee+ - Household fee
    #
    # ==== Examples
    #
    # Tariffe.with_total_calculation(10, 100.0).total # => 1290.0
    def with_total_calculation(calculator)
      raise ArgumentError unless calculator.is_a?(Tariffe::Calculator)

      sql = '(tariffes.month_fee + (%d * tariffes.invoice_fee) + (%f * tariffes.cashing_fee/100)) AS total, tariffes.*'
      select(sql % [calculator.amount_of_invoices.to_i, calculator.household_fee.to_f])
        .reorder('total %s  NULLS LAST' % calculator.sort_order)
    end
  end
end
