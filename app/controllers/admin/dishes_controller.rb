class Admin::DishesController < ApplicationController
  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new(dish_params)
    @dish.isActive = 1
    if @dish.save
      redirect_to admin_dish_path(@dish)
    else
      render :new
    end
  end

  def show
    @dish = Dish.find(params[:id])
  end

  def index
    @dishes = Dish.all
  end

  private
  
  def dish_params
    params.require(:dish).permit(:title, :description, :price, :img)
  end
  
end
