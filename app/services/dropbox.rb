require 'dropbox_api'

class Dropbox
  attr_accessor :lead

  def initialize(lead)
    @lead = lead
  end

  def call 
    client = DropboxApi::Client.new(ENV['DROPBOX_ACCESS_TOKEN'])
    # client.create_folder("/Test")
    # filename_path = ActiveStorage::Blob.service.send(:path_for, @lead.contact_attachment_file.key)
    # new_filename = "#{@lead.company_name.parameterize}/#{@lead.contact_attachment_file.filename.to_s}"
    # File.open(filename_path) do |f|
    #   client.upload_by_chunks "/ContactUs/#{new_filename}", f
    # end

    @lead.contact_attachment_file.purge
  end
end