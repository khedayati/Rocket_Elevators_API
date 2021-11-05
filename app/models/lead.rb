class Lead < ApplicationRecord
    has_one_attached :contact_attachment_file
    def attachment_path
        
    end

    def to_s
        "Lead #" + self.id.to_s
    end
    

end
