class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.includes([:user]).where(public: true).order(updated_at: :desc)
    @foods = Food.joins(:recipe_foods)
    @total = 0
    @foods.each do |food|
      @total += food.price
    end
  end
end
