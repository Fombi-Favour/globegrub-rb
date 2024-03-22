class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.includes([:user]).where(public: true).order(updated_at: :desc)
  end
end
