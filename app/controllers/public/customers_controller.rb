class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @post_cosmes = @customer.post_cosmes
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to public_customer_path(@customer.id)
  end


  private

  def customer_params
    params.require(:customer).permit(:name, :profile_image, :introduction)
  end

end
