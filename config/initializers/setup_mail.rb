class SetupMail < ActionMailer::Base

# ActionMailer::Base.smtp_settings = {  
  # :address              => "smtp.gmail.com",  
  # :port                 => 587,  
  # :domain               => "curseit.com",  
  # :user_name            => "curseit",  
  # :password             => "secret",  
  # :authentication       => "plain",  
  # :enable_starttls_auto => true  
# } 

if Rails.env != 'test'
  email_settings = YAML::load(File.open("#{Rails.root.to_s}/config/email.yml"))
  ActionMailer::Base.smtp_settings = email_settings[Rails.env] unless email_settings[Rails.env].nil?
end


end