
class TriggerSendTwilioJob < ApplicationJob
  queue_as :default

  def perform(user_id, trigger_id)
    user = User.find(user_id)
    trigger = Trigger.find(trigger_id)
    puts "Sending a reminder Whatsapp to  #{user.email}..."
    ::TwilioService.new(trigger)
    # binding.pry
    # notifier.username = 'Thibaut'
    # notifier.channel = ‘#random’
    # notifier.ping "#{trigger.name} : #{trigger.url}"
    sleep 2
    puts "Done! Whatsapp sent to #{user.email} "
  end
end
