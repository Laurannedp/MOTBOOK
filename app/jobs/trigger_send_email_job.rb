class TriggerSendEmailJob < ApplicationJob
  queue_as :default

  def perform(user_id, trigger_id)
    user = User.find(user_id)
    trigger = Trigger.find(trigger_id)
    puts "Sending a reminder email to  #{user.email}..."
    UserMailer.with(user: user, trigger: trigger).reminder.deliver_now
    sleep 2
    puts "Done! Email sent to #{user.email} "
  end
end
