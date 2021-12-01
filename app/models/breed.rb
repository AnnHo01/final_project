class Breed < ApplicationRecord
  belongs_to :pet_group
  has_many :pets
  validates :name, uniqueness: true
  validates :name, :image, :price, presence: true
end
