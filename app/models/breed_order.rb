class BreedOrder < ApplicationRecord
  belongs_to :order
  belongs_to :breed
end
