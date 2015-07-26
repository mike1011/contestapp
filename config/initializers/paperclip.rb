require 'paperclip/media_type_spoof_detector'         
module Paperclip         
 class MediaTypeSpoofDetector        
    def spoofed?         
      false       
    end       
  end  


##27march-method to show styles using expiring url- i.avatar.expiring_url(60,:thumb)
module Storage
	module S3
		def expiring_url(time = 3600, style = default_style)
		s3_object(style).url_for(:read, :expires_in => time, :secure => true)
		end
	end
end


end 


###code added above to avoid error-content type spoofed for uploading mp3 returing mpeg

Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
Paperclip::Attachment.default_options[:path] = '/:class/:id/:style/:filename'

##if Rails.env == "production" 
   #S3_CREDENTIALS = { :access_key_id => ENV['S3_KEY'], :secret_access_key => ENV['S3_SECRET'], :bucket => "ourbucket"} 
 ##else 
   S3_CREDENTIALS = Rails.root.join("config/s3.yml")
##end