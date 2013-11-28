class Bank < ActiveRecord::Base
  scope :active, -> { where active: true }

  has_many :tariffes

  validates :title, presence: true, uniqueness: true
end
