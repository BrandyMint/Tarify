module ApplicationHelper
  def app_version
    'v' + Tarify.version.format( "%M.%m.%p" )
  end

  def amount_hint f
    if f.object.amount_of_invoices.present?
      'штук в месяц'
    else
      false
    end
  end

  def fee_hint f
    if f.object.household_fee.present?
      'рублей в месяц'
    else
      false
    end
  end

  def fee value
    return '&middot;'.html_safe unless value
    precision = 2
    precision = 0 if value==value.to_i
    number_to_percentage value, precision: precision
  end

  def money value
    number_to_currency value, precision: 0
  end

  def icon *classes
    css = classes.map{|c| "icon-#{c}"}.join(' ')
    content_tag :i, '', :class => "icon #{css}"
  end

  def badge count, css_id ='', type = ''
    # Скрываем badge если в нем пусто. JS сам его покажет когда появится информация
    #
    options = {
      :class => "badge badge-#{type}", :id => css_id
    }
    # options[:style] = 'visibility: hidden' if count.to_i == 0
    counter_tag count, options
  end

  def counter_tag count, options={}
    count = '' if count == 0
    content_tag :span, count, options
  end

  def current_url(overwrite={})
    url_for :only_path => false, :params => params.merge(overwrite)
  end

end
