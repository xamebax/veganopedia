class ProductsController < ApplicationController
  def index
    @products = Product.all
    respond_with @products
  end

  def show
    @product = Product.find(params[:id])
    respond_with @product
  end

  def new
    @product = Product.new
    respond_with @product
  end

  def create
    @product = Product.new(params[:product])
    @product.save!
    redirect_to products_path, :notice => successfully_created(@product)
  rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotSaved => e
    render :action => :new
  end

  def edit
    @product = Product.find(params[:id])
    respond_with @product
  end

  def update
    @product = Product.find(params[:id])
    @product.update_attributes!(params[:product])
    redirect_to products_path, :notice => successfully_updated(@product)
  rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotSaved => e
    render :action => :edit
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path, :notice => successfully_destroyed(@product)
  end

  comment_destroy_conditions do |comment|
    # false
    comment.owner == current_user
  end
end
