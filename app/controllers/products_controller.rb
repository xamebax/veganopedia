class ProductsController < ApplicationController
  def index
    @products = Product.all
    respond_with @products
  end

  def show
    @product = Product.find(params[:id])
    @comment = Comment.new
    respond_with @product, @comment
  end

  def new
    @product = Product.new
    respond_with @product
  end

  def create
    Product.create!(params[:product])
    redirect_to products_path, :notice => "Successfully created product."
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
    redirect_to products_path, :notice => 'Successfully updated product.'
  rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotSaved => e
    render :action => :edit
  end

  def destroy
    Product.find(params[:id]).destroy
    redirect_to products_path, :notice => 'Successfully deleted product.'
  end
end
