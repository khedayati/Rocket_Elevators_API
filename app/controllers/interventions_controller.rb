class InterventionsController < InheritedResources::Base
  require 'zendesk_api'

  def index
    @interventions = Intervention.all
  end

  def new
    @intervention = Intervention.new
  end

  # def create
  #   @intervention = Intervention.new(params)
  # end

  def fact_intervention_params
    params.require(:fact_intervention).permit(:author, :customer_id, :building_id, :battery_id, :column_id, :elevator_id, :employee_id, :intervention_start, :intervention_end, :result, :report, :status)
  end

  def updateBuildings
    @building_list = Building.where(customer_id: params[:customer_id])
    render json: {buildings: @building_list}
  end

  def submit
    @intervention = Intervention.create(
      author: params[:author],
      customer_id: params[:customer_id], 
      building_id: params[:building_id],
      battery_id: params[:battery_id],
      column_id: params[:column_id],
      elevator_id: params[:elevator_id],
      employee_id: params[:employee_id],
      author: params[:current_use].employee[0],
    )
    if @intervention.save
      puts("successfully save")
    else
      puts("not save")
    end
  end

  def save

  end
  # def create
  #   @intervention = Intervention.new(intervention_params)

  #   respond_to do |format|
  #     if @quote.save
  #       format.html { redirect_to root_path, notice: 'Quote was successfully created.' }
  #       format.json { render :show, status: :created, location: @quote }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @quote.errors, status: :unprocessable_entity }
  #     end
  #   end

  #   ZendeskAPI::Ticket.create!(@client,
  #   :subject => "#{@quote.company_name}",
  #   :comment => { :value =>
  #     "The company #{@quote.company_name} has made a quote for a building of type #{@quote.building_type} and wants the #{@quote.product_line} service.
  #     Quote Information:
  #     amount of elevators: #{@quote.amount_elevators}
  #     installation fees: #{@quote.installation_fees}
  #     total: #{@quote.total_cost}" },
  #   :type => "task",
  #   :priority => "urgent")

  # end

  def updateBattery
    @battery_list = Battery.where(building_id: params[:building_id])
    render json: {batteries: @battery_list}
  end

  def updateColumn
    @column_list = Column.where(battery_id: params[:battery_id])
    render json: {columns: @column_list}
  end

  def updateElevator
    @elevator_list = Elevator.where(column_id: params[:column_id])
    render json: {elevators: @elevator_list}
  end

  def create
    @intervention = Intervention.new(fact_intervention_params)

    respond_to do |format|
      if @intervention.save
        format.html { redirect_to @intervention, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @intervention }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end

    # respond_to do |format|
    #   if @quote.save
    #     format.html { redirect_to root_path, notice: 'Quote was successfully created.' }
    #     format.json { render :show, status: :created, location: @quote }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @quote.errors, status: :unprocessable_entity }
    #   end
    # end

    # ZendeskAPI::Ticket.create!(@employee,
    # :subject => "#{@intervention.id}",
    # :comment => { :value =>
    #   "The employee #{@fact_intervention.author} has made a intervention for #{@fact_intervention.customer_id} for the building# #{@fact_intervention.building_id} at the battery # #{@fact_intervention.battery_id} at the column # #{@fact_intervention.column_id} at the elevator# #{@fact_intervention.elevator_id}. the employee# #{@fact_intervention.employee_id} description of the intervention#{@fact_intervention.report}."
    #   # Quote Information:
    #   # amount of elevators: #{@quote.amount_elevators}
    #   # installation fees: #{@quote.installation_fees}
    #   #{@quote.total_cost}" },
    # :type => "task",
    # :priority => "urgent")

  # if params[:project].present?
  #     @tasks = Project.find(params[:project]).tasks
  # else
  #     @tasks = Task.all
  # end
  # if request.xhr?
  #     respond_to do |format|
  #         format.json {
  #             render json: {tasks: @tasks}
  #         }
  #     end
  # end
end
