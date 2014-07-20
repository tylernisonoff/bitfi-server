class Connection < ActiveRecord::Base
  belongs_to :device
  belongs_to :tetherer, class_name: 'User'

  scope :active, -> { where(active: true) }
  scope :pending, -> { where(active: false, terminated_at: nil) }
  scope :expired, -> { where('terminated_at IS NOT NULL') }
end
