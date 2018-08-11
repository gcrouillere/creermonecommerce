class OrderMailer < ApplicationMailer

  def confirmation_mail_after_order(user, order)
    @user = user
    @order = order
    productqty = @order.basketlines.sum(:quantity)
    mail(to: @user.email, subject: "Confirmation de commande de #{productqty > 1 ? ENV['MODEL'] : ENV['MODEL'][0...-1]}")
  end

  def mail_francoise_after_order(user, order)
    @user = user
    @order = order
    mail(to: "#{ENV['EMAIL']}", subject: 'Nouvelle commande recue')
  end

  def send_tracking_after_order(user)
    @user = user
    mail(to: @user.email, subject: 'Numéro de suivi pour votre colis')
  end

  def model_print_mail(user)
    if user.produit.present? && user.produit != ""
      return user.produit[-1] == "s" ? user.produit.capitalize : (user.produit[-2..-1] == "au" ? user.produit.capitalize + "x" : user.produit.capitalize + "s")
    else
      return ENV['MODEL']
    end
  end

end
