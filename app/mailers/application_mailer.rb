class ApplicationMailer < ActionMailer::Base
  default from: 'contact@'+ENV['APPNAME']+'.fr'
  layout 'mailer'
end
