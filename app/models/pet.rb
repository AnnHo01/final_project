class Pet < ApplicationRecord
  has_one_attached :image
  belongs_to :breed
  validates :name, presence: true
end
