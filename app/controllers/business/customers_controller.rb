module Business
  class CustomersController < ApplicationController
    before_action :get_customer, only: [:edit, :update, :delete_customer, :preview]

    def get_customer
      @customer = Customer.find(params[:id])
    end

    def new
      @customer = Customer.new
    end

    def create
      @customer = Customer.new(customer_params)
      if @customer.save
        redirect_to business_customers_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def index
      @customers = Customer.all
    end

    def edit
    end

    def update
      if @customer.update(customer_params)
        redirect_to business_customers_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def delete_customer
      @customer.destroy
      redirect_to business_customers_path, status: :see_other
    end

    def preview
    end

    private

    def customer_params
      params.require(:customer).permit(:name, :age, :phone, :email)
    end
  end
end