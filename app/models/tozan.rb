class Tozan < ApplicationRecord
  validates :mountain, presence: true
  validates :mountain, presence: { maximum: 30 }
end
