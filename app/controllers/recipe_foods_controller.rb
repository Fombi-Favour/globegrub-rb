class RecipeFoodsController < ApplicationController
  before_action :set_recipe
  def index
    @recipe_foods = RecipeFood.all
  end

  def new
    @recipe_food = RecipeFood.new
  end

  def show
    @recipe_food = RecipeFood.find_by_id(params[:id])

    return unless @recipe_foods.nil?

    redirect_to recipe_recipe_foods_path
  end

  def create
    @recipe_food = @recipe.recipe_foods.build(recipe_food_params)

    if @recipe_food.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy

    redirect_to recipe_path(@recipe)
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  # def set_food
  #   @food = Food.find(params[:food_id])
  # end

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, recipe_ids: [], food_ids: [])
  end
end
