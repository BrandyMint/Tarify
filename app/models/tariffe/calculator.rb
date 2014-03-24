class Tariffe::Calculator
  include ActiveModel::Model
  extend ActiveModel::Naming

  attr_accessor :amount_of_invoices, :household_fee, :sort_order, :sort_field

  def sort_order
    if %w(asc desc).include?(@sort_order)
      @sort_order
    else
      'asc'
    end
  end

  def sort_field
    Tariffe.attribute_names.include?(@sort_field) ? @sort_field : 'bank_id'
  end

  def reverse_order
    asc? ? 'desc' : 'asc'
  end

  def params_order
    { self.class.model_name.param_key => { sort_order: reverse_order, sort_field: sort_field } }.with_indifferent_access
  end

  def asc?
    sort_order == 'asc'
  end

  def filled?
    amount_of_invoices.to_i > 0 || household_fee.to_f > 0.0
  end
end
