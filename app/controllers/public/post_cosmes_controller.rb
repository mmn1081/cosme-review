class Public::PostCosmesController < ApplicationController
  before_action :authenticate_customer!#ログインしていないとログイン画面へ

  def edit
    @post_cosme = PostCosme.find(params[:id])
    @post_cosme.customer == current_customer
  end

  def update
    @post_cosme = PostCosme.find(params[:id])

    if @post_cosme.update(post_cosme_params)
      redirect_to public_post_cosme_path(@post_cosme.id)
      flash[:notice] = "更新できました"
    else
      render :edit
    end
  end

  def show
    @post_cosme = PostCosme.find(params[:id])
    @customer = current_customer
    @comment = Comment.new
    @tags = Tag.all
  end

  def index
    @tags = Tag.all
    if params[:tag_id].present?
      @post_cosmes = PostCosme.where(tag_id: params[:tag_id]).page(params[:page]).order("id DESC")
    else
      @post_cosmes = PostCosme.page(params[:page]).order("id DESC")
    end
    @customer = current_customer
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
    if @post_cosme.save
      redirect_to public_post_cosmes_path(@post_cosme.id)
      flash[:notice] = "投稿できました"
    else
      render :new
    end
  end

  private

  def post_cosme_params
    params.require(:post_cosme).permit(:cosme_name, :image, :introduction, :evaluation, :tag_id)
  end

end
