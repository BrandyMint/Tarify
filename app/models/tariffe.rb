class Tariffe < ActiveRecord::Base
  include Concerns::Calculations

  scope :ordered, -> { order :position }
  scope :active,  -> { where active: true }

  belongs_to :bank

  mount_uploader :pdf, AttachUploader

  validates :title, presence: true, uniqueness: { scope: :bank_id }

  def to_s
    title
  end

  def siblings
    self.class.active.ordered.where(bank: bank).where.not(id: id)
  end
end
