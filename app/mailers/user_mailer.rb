class UserMailer < ActionMailer::Base
  default from: "amartinez@tlm.com.co"

  def send_results(user,pos,points,type_of_bet)
    @user=user
    @pos = pos
    @points = points
    @greeting = "Hola #{@user.name}"
    @type_of_bet = type_of_bet
 
    mail to: @user.mail, subject: (@type_of_bet ? "Ya sabes en qué posición vas en la polla de la suerte?" : "Ya sabes en qué posición vas en la polla de Excel?")
  end

end
