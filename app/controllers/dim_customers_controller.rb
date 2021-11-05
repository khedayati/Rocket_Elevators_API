class DimCustomersController < InheritedResources::Base

  private

    def dim_customer_params
      params.require(:dim_customer).permit()
    end

end
