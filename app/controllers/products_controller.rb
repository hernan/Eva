class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    render :form
  end

  def edit
    @product = Product.find(params[:id])
    render :form
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path, notice: "Product was successfully created."
    else
      render :form, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path, notice: "Product was successfully updated."
    else
      render :form, status: :unprocessable_entity
    end
  end

  def destroy
    Product.find(params[:id]).destroy!
    redirect_to products_path, notice: "Product was successfully removed."
  end

  private
    def product_params
      params.expect(
        product: [ :name, :sku, :active, :in_stock, evdata: {} ]
      )
    end
end
