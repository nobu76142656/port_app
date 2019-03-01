class Tozan < ApplicationRecord
  has_one_attached :image

  validates :mountain, presence: true
  validates :mountain, presence: { maximum: 30 }

  belongs_to :user
end
