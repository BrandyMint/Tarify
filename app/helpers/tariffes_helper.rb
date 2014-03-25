module TariffesHelper
  def sortable_heading(attribute)
    arrow   = if params[:tariffe_calculator].present?
      if params[:tariffe_calculator][:sort_field] == attribute || params[:tariffe_calculator][:sort_field].blank? && attribute == 'total'
        @calculator.asc? ? '<i class="fa fa-angle-up"/>' : '<i class="fa fa-angle-down"/>'
      else
        ''
      end
    end

    caption = raw("#{Tariffe.human_attribute_name(attribute)} #{arrow}")
    @calculator.sort_field = attribute
    link_to caption, current_url(params.deep_merge(@calculator.params_order))
  end

  def params_list *params
    str = '<table class="table">'
    params.each do |p|
      str << "<tr><td><b>#{Tariffe.human_attribute_name(p)}</b></td><td>#{@tariffe.send(p)}</td></tr>"
    end
    str << '</table>'
    str.html_safe
  end
end
