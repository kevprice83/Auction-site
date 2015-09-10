class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @user = User.find_by(params[:id])
    @product = @user.products.new
  end

  def create
    @user = User.find_by(params[:id])
    @product = @user.products.new(product_params)

    if @product.valid?
      @product.save
      redirect_to user_products_path, notice: "Product #{@product.title} was posted successfully"
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :deadline)
  end
end
