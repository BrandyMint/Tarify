class Tariffe::Calculator
  include ActiveModel::Model
  extend ActiveModel::Naming

  attr_writer :amount_of_invoices, :household_fee, :sort_order

  def amount_of_invoices
    @amount_of_invoices || 0
  end

  def household_fee
    @household_fee || 0.0
  end

  def sort_order
    if %w(asc desc).include?(@sort_order)
      @sort_order
    else
      'asc'
    end
  end

  def reverse_order
    asc? ? 'desc' : 'asc'
  end

  def params_order
    { self.class.model_name.param_key => { sort_order: reverse_order } }.with_indifferent_access
  end

  def asc?
    sort_order == 'asc'
  end

  def filled?
    amount_of_invoices.to_i > 0 || household_fee.to_f > 0.0
  end
end
