class OrderMailer < ApplicationMailer

  def confirmation_mail_after_order(user, order, amount)
    @user = user
    @order = order
    @amount = amount
    @model_string = model_print_mail(@user)
    productqty = @order.basketlines.sum(:quantity)
    mail(to: @user.email, subject: "Confirmation de commande de #{productqty > 1 ? @model_string : @model_string[0..-2]}")
  end

  def mail_francoise_after_order(user, order, amount)
    @user = user
    @order = order
    @amount = amount
    @model_string = model_print_mail(@user)
    mail(to: @user.email, subject: 'Nouvelle commande recue')
  end

  def model_print_mail(user)
    if user.produit.present? && user.produit != ""
      return user.produit[-1] == "s" ? user.produit.capitalize : (user.produit[-2..-1] == "au" ? user.produit.capitalize + "x" : user.produit.capitalize + "s")
    else
      return ENV['MODEL']
    end
  end

end
