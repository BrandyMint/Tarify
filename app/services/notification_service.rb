class NotificationService
  include Rails.application.routes.url_helpers

  def new_order order
    AdminUser.order_notify.each do |admin|
      send_sms new_order_message(order), admin.phone
      new_order_email(order, admin.email)
    end

    if order.bank.notification_phone?
      send_sms new_order_message(order), order.bank.notification_phone
    end
    if order.bank.notification_email?
      new_order_email(order, order.bank.notification_email)
    end
  end

  private

  def new_order_email order, email
    OrderMailer.new_order_for_admin(order, email).deliver
  end

  def new_order_message order
    tariffe = order.tariffe.title

    # admin_url = admin_order_url(order)
    "Заказ №#{order.id}. #{tariffe}"
  end

  def send_sms message, phone=Settings.sms_phone
    params = Rails.env == 'production' ? {} : {test: 1}
    Rails.logger.info "SEND SMS: #{phone}: #{message}"
    LittleSms.send_sms(phone, message, params)
  end
end
