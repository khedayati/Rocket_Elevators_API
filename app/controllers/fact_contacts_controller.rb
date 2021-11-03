class FactContactsController < InheritedResources::Base

  private

    def fact_contact_params
      params.require(:fact_contact).permit()
    end

end
