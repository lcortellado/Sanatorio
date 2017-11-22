Rails.application.configure do
config.action_mailer.delivery_method = :smtp
 config.action_mailer.smtp_settings = {
 :authentication => :plain,
 :address => ENV["smtp.gmail.com"],
 :port => ENV["587"],
 :domain =>ENV["gmail.com"],
 :user_name => ENV["luiscarlosortecabral@gmail.com"],
 :password => ENV["19911991charly"]
 }
end