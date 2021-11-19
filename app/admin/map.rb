ActiveAdmin.register_page "Map" do
  content do
    panel "Google Map" do
      render "map"
    end
  end  
end