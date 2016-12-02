class Api::DishesController < ApiController

  def index
    dishes = Dish.where(isActive: 1).select(:id, :title, :description, :price)
    list_dishes = {"foodInfo": []}
    dishes.each do |dish|
      d = {id: dish.id, namefood: dish.title, price: dish.price, info: dish.description, linkImage: dish.img_url}
      list_dishes[:foodInfo] << d
    end
    respond_to do |format|
      format.json { render json: list_dishes }
    end
  end
end
