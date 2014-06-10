class UserMailer < ActionMailer::Base
  default from: "amartinez@tlm.com.co"

  def send_results(user,pos,points)
    @user=user
    @pos = pos
    @points = points
    @greeting = "Hola #{@user.name}"
 
    mail to: @user.mail, subject: "Ya sabes en qué posición vas en la polla?"
  end

end
