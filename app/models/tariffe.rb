class Tariffe < ActiveRecord::Base
  scope :ordered, -> { order :position }
  scope :active, -> { where active: true }

  belongs_to :bank

  #mount_uploader :pdf, AttachUploader

  validates :title, presence: true, uniqueness: { scope: :bank_id }
end
