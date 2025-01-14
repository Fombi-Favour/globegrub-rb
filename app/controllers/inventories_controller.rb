class InventoriesController < ApplicationController
  def index
    @inventories = current_user.inventories.order(:created_at)
  end

  def show
    @inventory = Inventory.find(params[:id])
    @foods = @inventory.inventory_foods.includes(:food)
    @food = Food.all
  end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = current_user.inventories.build(inventory_params)
    if @inventory.save
      redirect_to inventories_path, notice: 'Inventory created successfully'
    else
      render :new, notice: 'Inventory not created'
    end
  end

  private

  def inventory_params
    params.require(:inventory).permit(:name, :description)
  end
end
