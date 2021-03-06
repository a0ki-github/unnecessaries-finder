class Item < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 255 }
  validates :why_release, length: { maximum: 65535 }
  scope :filled, -> { where.not(why_release: '') }
  scope :detected, ->(detected_items) { where(name: detected_items) }
end
