module TariffesHelper
  def sortable_heading(attribute)
    arrow   = if @calculator.filled?
      if params[:tariffe_calculator][:sort_field] == attribute || params[:tariffe_calculator][:sort_field].blank? && attribute == 'total'
        @calculator.asc? ? '<i class="fa fa-angle-up"/>' : '<i class="fa fa-angle-down"/>'
      else
        ''
      end
    else
      ''
    end

    if @calculator.filled?
      caption = raw("#{Tariffe.human_attribute_name(attribute)} #{arrow}")
      @calculator.sort_field = attribute
      link_to caption, current_url(params.deep_merge(@calculator.params_order))
    else
      Tariffe.human_attribute_name(attribute)
    end
  end
end
