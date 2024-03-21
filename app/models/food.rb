class Food < ApplicationRecord
  has_many :recipe_foods
  has_many :inventory_foods

  validates :name, presence: true
  validates :measure_unit, presence: true
  validates :price, presence: true
end
