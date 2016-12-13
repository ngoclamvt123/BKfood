class Admin::OrdersController < ApplicationController

  def change_status
    @order = Order.find(params[:id])
    @order.update_attributes(status: params[:val].to_i)
    respond_to do |format|
      format.js
    end
  end


  private
  
  def dish_params
    params.require(:orders).permit(:title, :description, :price, :img)
  end
  
end
