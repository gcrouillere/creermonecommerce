class PaymentsController < ApplicationController
  before_action :set_order, only: [:create, :new]
  skip_before_action :authenticate_user!, only: [:new, :create]

  def new
  end

  def create
    # STRIPE
    @order = set_order
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,   # You should store this customer id and re-use it.
      amount:       @order.amount_cents, # or amount_pennies
      description:  "Payment for ceramique, for order #{@order.id}",
      currency:     @order.amount.currency
    )

    @order.update(payment: charge.to_json, state: 'paid')

    @lesson =  @order.lesson
    unless @lesson.present?
      # SEND EMAILS
      @user = current_user
      @amount = Amountcalculation.new(@order).calculate_amount(@order)
      if @user
        OrderMailer.confirmation_mail_after_order(@user, @order, @amount).deliver_now
        OrderMailer.mail_francoise_after_order(@user, @order, @amount).deliver_now
      end
      # CLEAR SESSION AND REDIRECT TO CONFIRMATION
      session[:order] = nil
      redirect_to confirmation_path
    else
      # SEND EMAILS
      LessonMailer.mail_user_after_lesson_payment(@lesson).deliver_now
      LessonMailer.mail_francoise_after_lesson_payment(@lesson).deliver_now
      redirect_to stage_payment_confirmation_path
    end

    # REDIRECT TO PAYMENT
    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_order_payment_path(@order)
  end

  private

  def set_order
    @order = Order.where(state: 'pending').find(params[:order_id])
  end

end
