# frozen_string_literal: true


ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    div class: 'blank_slate_container', id: 'dashboard_default_message' do
      span class: 'blank_slate' do
        span I18n.t('active_admin.dashboard_welcome.welcome')
        small I18n.t('active_admin.dashboard_welcome.call_to_action')
      end
    end

  columns do
    column max_width: "200px", min_width: "100px" do
      span "Column # 1"
    end
    column do
      span "Column # 2"
    end
  end
  table_for current_user do
    column(:email) { |payment| payment } 
    column "First Name",     :first_name, max_width: "50px"
    column "Last Name",      :last_name
    column "Create At",      :created_at
  end



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
