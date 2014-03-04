class OrderMailer < BaseMailer
  def new_order_for_admin order, email
    @order = order
    @site = Settings.app.default_url_options.host
    mail(to: email, subject: "Новый заказ на сайте #{@site}")
  end
end
