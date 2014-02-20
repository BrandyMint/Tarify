class TariffeDecorator < Draper::Decorator
  delegate_all

  def pdf_link
    h.link_to 'pdf', source.pdf.url if source.pdf.present?
  end

  def summary
    h.simple_format source.summary
  end

  def month_fee
    h.money source.month_fee
  end

  def invoice_fee
    h.money source.invoice_fee
  end

  def cashing_fee
    h.money source.cashing_fee
  end

  def total
    h.money source.total
  end

end
