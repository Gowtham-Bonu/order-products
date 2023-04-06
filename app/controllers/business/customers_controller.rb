module Business
  class CustomersController < ApplicationController
    before_action :get_customer, only: [:edit, :update, :delete_customer, :preview]

    def index
      @customers = Customer.all
    end

    def new
      @customer = Customer.new
    end

    def create
      @customer = Customer.new(customer_params)
      if @customer.save
        redirect_to business_customers_path, notice: "you have successfully created a customer"
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @customer.update(customer_params)
        redirect_to business_customers_path, notice: "you have successfully updated the customer"
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def delete_customer
      if @customer.destroy
        redirect_to business_customers_path, status: :see_other, notice: "you have successfully deleted the customer"
      else
        redirect_to business_customers_path, status: :unprocessable_entity, alert: "The delete action didn't work.."
      end
    end

    def preview; end

    private

    def get_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:name, :age, :phone, :email)
    end
  end
end