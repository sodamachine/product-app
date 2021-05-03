class SolutionsController < ApplicationController

    before_action :require_login

    def index
        @solutions = Solution.all
    end
    
    def new
        if params[:product_id]
            @product = Product.find_by(id: params[:product_id])
            @solution = @product.solutions.build
        else
            @solution = Solution.new
            @products = Product.all
        end
    end

    def create
        @solution = Solution.create(solution_params)
        @solution.user = current_user
        if params[:item_id]
            @solution.product_id = params[:product_id]
        end
        @solution.save
        redirect_to products_path
    end

    def edit
    end

    def update
    end

    private

        def solution_params
            params.require(:solution).permit(:issue, :ingredient, :description, :product_id)
        end

end