class OrdersController < ApplicationController
  before_action :get_order, only: [:edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show; end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to root_path, notice: "you have successfully created an order"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @order.update(order_params)
      product = Product.find(params[:product_id])
      redirect_to product_path(product), notice: "you have successfully updated the order"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    product = Product.find(params[:product_id])
    if @order.destroy
      redirect_to product_path(product), status: :see_other, notice: "you have successfully deleted the order"
    else
      redirect_to product_path(product), status: :unprocessable_entity, alert: "The delete action didn't work.."
    end
  end

  private

  def get_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:name, :status, :quantity, :product_id)
  end
end
