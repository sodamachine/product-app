class ProductsController < ApplicationController

    before_action :set_product, except: [:index, :new, :create]
    before_action :require_login

    def index
        if params[:user_id]
            user = User.find_by(id: params[:user_id])
            @products = user.products
        else
            @products = Product.all
        end
    end

    def new
        @product = Product.new
        @product.solutions.build(user: current_user)
        set_solutions
    end

    def create
        @product = Product.new(product_params)
        @product.solutions.each {|s| s.user = current_user}
        if @product.save
            redirect_to product_path(@product)
        else
            @errors = @product.errors.full_messages
            render :new
        end
    end

    def edit
        #if !@product.users.include?(current_user)
        #    redirect_to products_path
        #end
        #@solutions = @product.solutions.where(user_id: current_user.id)
    end

    def update
        if @product.users.include?(current_user)
            @product.update(product_params)
            redirect_to product_path(@product)
        else
            @errors = ["Invalid Action: Unable to Edit Product"]
            render :edit
        end
    end

    def destroy
        if @product.users.include?(current_user)
            @product.delete
            redirect_to products_path
        else
            @errors = ["Invalid Action: Unable to Delete Product"]
            render :show
        end
    end

    private

        def product_params
            params.require(:product).permit(:name, :brand, solutions_attributes: [:issue, :ingredient, :description, :user_id, :id])
        end

        def set_product
            @product = Product.find_by(id: params[:id])
        end

        def set_solutions
            @solutions = @product.solutions.select{|s| s.user_id == current_user.id}
        end

end