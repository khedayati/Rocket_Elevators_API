class ChangePnhoneNumberOfTheBuildingAdministratorToPhoneNumberOfTheBuildingAdministrator < ActiveRecord::Migration[5.2]
  def change
    rename_column :buildings, :pnhone_number_of_the_building_administrator, :phone_number_of_the_building_administrator
  end
end
