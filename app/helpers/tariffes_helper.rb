module TariffesHelper
  def total_heading(calculator)
    arrow   = if calculator.filled?
      calculator.asc? ? '&#9652;' : '&#9662;'
    else
      ''
    end

    caption = raw("Предполагаемая сумма расходов #{arrow}")
    link_to caption, root_path(params.deep_merge(calculator.params_order))
  end
end
