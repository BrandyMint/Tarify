class Order < ActiveRecord::Base
  belongs_to :tariffe
  has_one :bank, through: :tariffe

  validates :name, presence: true
  validates :phone, presence: true, length: {is: 10}
  validates :email, email: true, allow_blank: true

  def phone= phone
    super phone[4,3].to_s + phone[9,3].to_s + phone[13,2].to_s + phone[16,2].to_s
  end

  def view_phone
    "+7 (#{phone[0,3]}) #{phone[3,3]}-#{phone[6,2]}-#{phone[8,2]} "
  end

  state_machine do
    state :new
    state :process
    state :canceled
    state :done
  end
end
