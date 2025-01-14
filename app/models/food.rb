class Food < ApplicationRecord
  has_many :recipe_foods, dependent: :destroy
  has_many :inventory_foods, dependent: :destroy

  validates :name, presence: true
  validates :measure_unit, presence: true
  validates :price, presence: true
end
