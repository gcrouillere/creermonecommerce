class LessonMailer < ApplicationMailer

  def mail_user_after_lesson_destroy(lesson)
    @lesson = lesson
    @full_name = full_name(@lesson)
    @closest_start = Findcloseststart.new(@lesson).closest_start(@lesson)
    if @lesson.confirmed
      mail(to: @lesson.user.email, subject: "Annulation de votre stage chez #{@full_name}")
    else
      mail(to: @lesson.user.email, subject: "Refus de votre demande de stage chez #{@full_name}")
    end
  end

  def mail_user_after_confirmation(lesson)
    @lesson = lesson
    @full_name = full_name(@lesson)
    mail(to: @lesson.user.email, subject: "Confirmation de votre stage chez #{@full_name}")
  end

  def mail_francoise_after_lesson_create(lesson)
    @lesson = lesson
    @full_name = full_name(@lesson)
    mail(to: "#{ENV['EMAIL']}", subject: 'Nouvelle demande de stage reçue')
  end

  def mail_user_after_lesson_payment(lesson)
    @lesson = lesson
    @full_name = full_name(@lesson)
    mail(to: @lesson.user.email, subject: "Paiement des arrhes pour votre stage chez #{@full_name}")
  end

  def mail_francoise_after_lesson_payment(lesson)
    @lesson = lesson
    @full_name = full_name(@lesson)
    mail(to: "#{ENV['EMAIL']}", subject: 'Paiement des arrhes pour stage recu')
  end

  def full_name(lesson)
    return "#{(lesson.user.first_name ? lesson.user.first_name : ENV['FIRSTNAME']).capitalize} #{(lesson.user.last_name ? lesson.user.last_name : ENV['LASTNAME']).capitalize}"
  end
end
