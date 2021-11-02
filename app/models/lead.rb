class Lead < ApplicationRecord
    has_one_attached :contact_attachment_file
    def attachment_path
        
    end
    
end
