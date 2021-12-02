class Breed < ApplicationRecord
  has_one_attached :image
  belongs_to :pet_group
  has_many :pets
  validates :name, uniqueness: true
  validates :name, :image, :price, presence: true
  validates :price, numericality: true
end
