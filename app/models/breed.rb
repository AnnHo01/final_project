class Breed < ApplicationRecord
  has_one_attached :image
  belongs_to :pet_group
  has_many :pets
  # has_many :orders, through: :breed_orders
  validates :name, uniqueness: true
  validates :name, :price, presence: true
  validates :price, numericality: true

  def to_builder
    Jbuilder.new do |breed|
      breed.name name
      breed.amount (price.round(2) * 100).to_i
      breed.quantity qty
      breed.description name
      breed.currency "cad"
    end
  end
end
