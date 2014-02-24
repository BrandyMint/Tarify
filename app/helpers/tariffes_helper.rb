module TariffesHelper
  def total_heading(calculator)
    arrow   = if calculator.filled?
      calculator.asc? ? '<i class="fa fa-angle-down"/>' : '<i class="fa fa-angle-up"/>'
    else
      ''
    end

    caption = raw("Предполагаемая сумма расходов #{arrow}")
    link_to caption, root_path(params.deep_merge(calculator.params_order))
  end
end
