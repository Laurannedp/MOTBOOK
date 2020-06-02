class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reminder.subject
  #
  def reminder
    @user = params[:user]
    @trigger = params[:trigger]
    mail(to: @user.email, subject: @trigger.name)
  end

  def hello
    mail(
      :subject => 'Hello from Postmark',
      :to  => 'pietrofouarge@gmail.com',
      :from => 'pfouarge@planetfirst.partners',
      :html_body => '<strong>Hello</strong> dear Postmark user.',
      :track_opens => 'true')
  end
end

# Test job is rails c with TriggerSendEmailJob.perform_later(User.first.id, Trigger.first.id)
