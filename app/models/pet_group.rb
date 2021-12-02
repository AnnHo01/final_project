class PetGroup < ApplicationRecord
  has_many :breeds
  validates :name, presence: true, uniqueness: true
  validates :total_pets, numericality: true
end
