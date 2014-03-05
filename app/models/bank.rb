class Bank < ActiveRecord::Base
  scope :active, -> { where active: true }

  has_many :tariffes

  validates :title, presence: true, uniqueness: true

  validates :notification_phone, length: {is: 10}, allow_blank: true
  validates :notification_email, email: true, allow_blank: true

  def notification_phone= notification_phone
    super notification_phone[4,3].to_s + notification_phone[9,3].to_s + notification_phone[13,2].to_s + notification_phone[16,2].to_s
  end

  def view_phone
    "+7 (#{notification_phone[0,3]}) #{notification_phone[3,3]}-#{notification_phone[6,2]}-#{notification_phone[8,2]} "
  end

  def to_s
    title
  end
end
