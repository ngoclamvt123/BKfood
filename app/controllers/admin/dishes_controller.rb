class Admin::DishesController < ApplicationController
  def new
    @dish = Dish.new
  end

  def edit
    @dish = Dish.find(params[:id])
  end

  def create
    @dish = Dish.new(dish_params)
    @dish.isActive = 1
    if @dish.save
      redirect_to admin_dishes_path
    else
      render :new
    end
  end

  def update
    @dish = Dish.find(params[:id])
    if @dish.update(dish_params)
      redirect_to admin_dishes_path
    else
      render :edit
    end
  end

  def show
    @dish = Dish.find(params[:id])
  end

  def index
    @dishes = Dish.order(created_at: :desc).page(params[:page]).per(10)
  end

  def toggle_active
    @dish = Dish.find(params[:id]).toggle!(:isActive)
    redirect_to admin_dishes_path
  end


  private
  
  def dish_params
    params.require(:dish).permit(:title, :description, :price, :img)
  end
  
end
