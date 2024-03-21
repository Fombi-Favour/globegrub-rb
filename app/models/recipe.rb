class Recipe < ApplicationRecord
  belongs_to :user

  has_many :recipe_foods

  validates :name, presence: true
  validates :prep_time, presence: true
  validates :cooking_time, presence: true
  validates :public, inclusion: { in: [true, false] }
end
