class Public::PostCosmesController < ApplicationController
  def edit
    @post_cosme = PostCosme.find(params[:id])
    if @post_cosme.customer == current_customer
     render :edit
    else
     redirect_to
    end
  end

  def update
    @post_cosme = PostCosme.find(params[:id])

    if @post_cosme.update(post_cosme_params)
      redirect_to public_post_cosmes_path(@post_cosme.id)
      
      
      
      flash[:notice] = "You have updated book successfully."
    else
      render :edit
    end
  end

  def show
    @post_cosme = PostCosme.find(params[:id])
  end

  def index
    @post_cosmes = PostCosme.all
  end

  def new
    @post_cosme = PostCosme.new
  end

  def destroy
    @post_cosme = PostCosme.find(params[:id])
    @post_cosme.destroy
    redirect_to public_post_cosmes_path
  end

  def create
    @post_cosme = PostCosme.new(post_cosme_params)
    @post_cosme.customer_id = current_customer.id
    @post_cosme.save
    redirect_to public_post_cosmes_path(@post_cosme.id)
  end

  private

  def post_cosme_params
    params.require(:post_cosme).permit(:cosme_name, :image, :introduction)
  end

end
