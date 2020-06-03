require 'slack-notifier'
require 'uri'
class SlackService
  def initialize(trigger)
    url
    binding.pry
    notifier = Slack::Notifier.new url
    # notifier.username = 'Thibaut'
    # notifier.channel = ‘#random’
    notifier.ping "#{trigger.name} : #{trigger.url}"
  end

  private

  def url
   ENV['SLACK_URL']
  end
end
