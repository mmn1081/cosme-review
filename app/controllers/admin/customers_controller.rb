class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    flash[:notice] = "successfully"
    redirect_to admin_customers_path(@customer.id)
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :introduction)
  end

end
