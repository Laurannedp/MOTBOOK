require 'slack-notifier'
class SlackService
  def initialize(trigger)
    notifier = Slack::Notifier.new "https://hooks.slack.com/services/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"
    # notifier.username = 'Thibaut'
    # notifier.channel = ‘#random’
    notifier.ping "#{trigger.name} : #{trigger.url}"
  end
end
