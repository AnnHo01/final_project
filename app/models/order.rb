class Order < ApplicationRecord
  belongs_to :customer
  has_many :breeds, through: :breed_orders
end
