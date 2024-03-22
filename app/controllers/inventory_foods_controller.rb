class InventoryFoodsController < ApplicationController
  def create
    @inventory = Inventory.find(params[:inventory_id])
    @food = @inventory.inventory_foods.new(inventory_food_params)

    if @food.save
      redirect_to inventory_path(@inventory.id)
    else
      render :new
    end
  end

  def destroy
    @inventory_food = InventoryFood.find(params[:id])
    @inventory_food.destroy

    redirect_to inventories_path
  end

  private

  def inventory_food_params
    params.require(:inventory_food).permit(:food_id, :quantity)
  end
end