class ProductsController < ApplicationController

    def index
        @products = Product.all
    end

    def show
        @product = Product.find_by(id: params[:id])
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
        if @product.save
            redirect_to product_path(@product)
        else
            @errors = @product.errors.full_messages
            render :new
        end
    end

    def edit
        @product = Product.find_by(id: params[:id])
    end

    def update
        @product = Product.find_by(id: params[:id])
        if @product.update(product_params)
            redirect_to product_path(@product)
        else
            @errors = @product.errors.full_messages
            render :edit
        end
    end

    def destroy
        product = Product.find_by(id: params[:id])
        product.delete
        redirect_to products_path
    end

    private

        def product_params
            params.require(:product).permit(:name)
        end

end