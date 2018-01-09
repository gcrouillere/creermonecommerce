class SignupMailer < ApplicationMailer

  def mail_after_signup(user)
    @user = user
    mail(to: "gcrouillere@hotmail.fr", subject: "Nouveau compte client créé")
  end

end
