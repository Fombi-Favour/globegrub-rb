class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipes_path, notice: 'Recipe successfully created'
    else
      render :new, notice: 'Recipe not created'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect_to recipes_path, notice: 'Recipe was successfully deleted'
  end

  private

  def recipe_params
    params.require(:recipes).permit(:name, :prep_time, :cooking_time, :description, :public)
  end
end
