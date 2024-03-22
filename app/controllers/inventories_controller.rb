class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.all
  end

  def show
    @inventory = Inventory.find(params[:id])
    @foods = @inventory.inventory_foods.includes(:food)
    @food = Food.all
  end
end
