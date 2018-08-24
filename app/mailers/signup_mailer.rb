class SignupMailer < ApplicationMailer

  def mail_after_signup(user)
    @user = user
    mail(to: "gcrouillere@hotmail.fr", subject: "Nouveau compte client créé")
  end

  def web_message(user, admin)
    @user = user
    @admin = admin
    mail(to: @admin.email, subject: "Inscription à la newsletter")
  end

end
