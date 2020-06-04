require 'twilio-ruby'
class TwilioService
  def initialize(trigger)
    account_sid = 'AC1e0e9c14499513e88e26c05b49b3b22e'
    auth_token = token
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    message = @client.messages.create(
                                 body: "#{trigger.name} : #{trigger.url}",
                                 from: 'whatsapp:+14155238886',
                                 to: 'whatsapp:+32479756915'
                                 to: 'whatsapp:+32496174768'
                               )

    puts message.sid
  end


  private

  def token
   ENV['TWILIO_TOKEN']
  end
end

