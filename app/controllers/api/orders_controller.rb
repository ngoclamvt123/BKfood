class Api::OrdersController < ApiController

  def create
    
    ActiveRecord::Base.transaction do
      @order = Order.create!(order_params)
      params[:order][:detail_orders].each do |order|
        detail_orders = DetailOrder.create!(dish_id: order[:dish_id], order_id: @order.id, quantity: order[:quantity])
        # p order[:dish_id]
      end
    end
    message = {message: "Order successful!"}
    render json: message, status: :created
  rescue NoMethodError => e
    message = {message: "Wrong format!"}
    render json: message, status: 400
  rescue ActiveRecord::RecordInvalid => e
    render json: {message: e}, status: 400
  rescue ActiveRecord::RecordNotFound => e
    message = {message: "Wrong format!"}
    render json: message, status: 400
  end

  private

  def order_params
    params.require(:order).permit(:name, :address, :phone)
  end
end
