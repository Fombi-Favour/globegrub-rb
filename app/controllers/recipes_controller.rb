class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes.order(:created_at)
  end

  def show
    @user = User.find(current_user.id)
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
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
    params.require(:recipe).permit(:name, :prep_time, :cooking_time, :description, :public)
  end
end
