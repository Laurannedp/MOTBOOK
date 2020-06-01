class TriggerSendEmail < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    puts "Sending a reminder email to  #{user.email}..."
    # TODO: perform a time consuming task like Clearbit's Enrinchment API.
    sleep 2
    puts "Done! Email sent to #{user.email} "
  end
end
