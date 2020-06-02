require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "reminder" do
    mail = UserMailer.reminder
    assert_equal "Reminder", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  def hello
    mail(
      :subject => 'Hello from Postmark',
      :to  => 'thibaut.dehem@gmail.com',
      :from => 'pfouarge@planetfirst.partners',
      :html_body => '<strong>Hello</strong> dear Postmark user.',
      :track_opens => 'true')
  end
end


# Test with: UserMailer.hello.deliver_now
