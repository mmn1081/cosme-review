class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!#ログインしていないとログイン画面へ
  before_action :ensure_current_customer, only: [:edit, :update]#URLで他のプロフィールを編集できないようにする

  def show
    @customer = Customer.find(params[:id])
    @post_cosmes = @customer.post_cosmes.page(params[:page]).order("id DESC")
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to public_customer_path(@customer.id)
      flash[:notice] = "更新できました"
    else
      render :edit
    end
  end


  private

  def customer_params
    params.require(:customer).permit(:name, :profile_image, :introduction)
  end

  def ensure_current_customer#URLで他のプロフィールを編集できないようにする
    if current_customer.id != params[:id].to_i
      flash[:notice]="権限がありません"
      redirect_to public_post_cosmes_path
    end
  end

end
