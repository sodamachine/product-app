class ProductsController < ApplicationController

    before_action :set_product, except: [:index, :new, :create]

    def index
        @products = Product.all
    end

    def show
        #set_product
    end

    def new
        @product = Product.new
        @product.solutions.build
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
        #set_product
    end

    def update
        #set_product
        if @product.update(product_params)
            redirect_to product_path(@product)
        else
            @errors = @product.errors.full_messages
            render :edit
        end
    end

    def destroy
        #set_product
        @product.delete
        redirect_to products_path
    end

    private

        def product_params
            params.require(:product).permit(:name, :brand, solutions_attributes: [:ingredient, :description])
        end

        def set_product
            @product = Product.find_by(id: params[:id])
        end

end