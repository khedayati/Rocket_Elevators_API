# frozen_string_literal: true
#= require chartkick

ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do

    
    connection = PG::Connection.new(host:'localhost',port:'5432',dbname:'data_warehouse',user:'yen',password:'password')
    timeline [
      ["Washington", "1789-04-29", "1797-03-03"],
      ["Adams", "1797-03-03", "1801-03-03"],
      ["Jefferson", "1801-03-03", "1809-03-03"]
    ]
    line_chart [{name: "Workout", data: {"2021-01-01" => 3, "2021-01-02" => 4}},{name: "Call parents", data: {"2021-01-01" => 5, "2021-01-02" => 3}}]

    
    # Here is an example of a simple dashboard with columns and panels.
    #
    # "hello"
    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end
end
