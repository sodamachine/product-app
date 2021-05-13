class SolutionsController < ApplicationController

    before_action :require_login
    
    def index
        if params[:issue]
            @solutions = Solution.issue_search(params[:issue])
        else
            @solutions = Solution.all
        end
    end
    
    def new
        if params[:product_id]
            @product = Product.find_by(id: params[:product_id])
            @solution = @product.solutions.build
            @products = Product.all
        else
            @solution = Solution.new
            @products = Product.all
        end
    end

    def create
        @solution = Solution.new(solution_params)
        @solution.user = current_user
        if params[:product_id]
            @solution.product_id = params[:product_id]
        end
        if @solution.save
            redirect_to solutions_path
        else
            @errors = @solution.errors.full_messages
            @products = Product.all
            render :new
        end
    end

    def edit
        #redirect_to solutions_path
    end

    def update
        if @solution.user != current_user
            @errors = @solution.errors.full_messages
            render :edit
        else
            @solution.update(solution_params)
            redirect_to solutions_path
        end
    end

    private

        def solution_params
            params.require(:solution).permit(:issue, :ingredient, :description, :product_id)
        end

end