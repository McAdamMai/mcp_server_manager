class NotificationMailer < ApplicationMailer
  default from: 'notifications@mcptoggle.com'

  def server_connected_email
    @user = params[:user]
    @server = params[:server]
    
    mail(to: @user.email, subject: "New Connection: #{@server.name} is now Active")
  end
end