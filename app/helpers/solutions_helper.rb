module SolutionsHelper

    def show_product_name(s, index)
        s.product.name if index
    end

    def form_url_helper(product)
        product ? product_solutions_path(product) : solutions_path
    end
    
end