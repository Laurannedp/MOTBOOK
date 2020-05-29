# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/reminder
  def reminder
    @user = User.first
    @mot = Mot.first

    UserMailer.with(user: @user, mot: @mot).reminder
  end

end
