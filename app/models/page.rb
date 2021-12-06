class Page < ApplicationRecord
  has_one_attached :image
  validates :title, :content, :permalink, presence: true
end
