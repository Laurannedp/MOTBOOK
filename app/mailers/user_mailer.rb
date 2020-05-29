class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reminder.subject
  #
  def reminder
    @user = params[:user]
    @mot = params[:mot]
    mail(to: @user.email, subject: 'Your tasks of the week')
  end
end
