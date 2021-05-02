class SolutionsController < ApplicationController

    def new
        @solution = Solution.new
        @products = Product.all
    end

    def create
        @solution = Solution.create(solution_params)
        redirect_to products_path
    end

    private

        def solution_params
            params.require(:solution).permit(:ingredient, :concern, :product_id)
        end

end