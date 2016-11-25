class Api::OrdersController < ApiController

  def create
    @order = Order.new(order_params)
    respond_to do |format|
      if @order.save
        format.json { render json: @order, status: :created }
      else
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end
  private
  def order_params
    params.require(:order).permit(:name)
  end
end
