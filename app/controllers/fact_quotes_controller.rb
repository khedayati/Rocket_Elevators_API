class FactQuotesController < InheritedResources::Base

  private

    def fact_quote_params
      params.require(:fact_quote).permit()
    end

end
