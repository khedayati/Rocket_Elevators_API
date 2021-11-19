require "net/http"
require "uri"
require "json"

require "rubygems"
require "twilio-ruby"

module ActiveAdmin::ElevatorHelper
  def send_sms_message(message)
    # Find your Account SID and Auth Token at twilio.com/console
    # and set the environment variables. See http://twil.io/secure
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    message = @client.messages
      .create(
        body: "#{message}",
        from: "#{ENV["TWILIO_FROM_PHONE"]}",
        to: "#{ENV["TWILIO_TO_PHONE"]}",
      )

    puts message.sid
  end

  def send_slack_notification(message)
    uri = URI.parse("https://slack.com/api/chat.postMessage")

    # Might have to change the bearer token since they get outdated fast
    headers = { "Content-type" => "application/json", "Authorization" => "Bearer #{ENV["SLACK_API_TOKEN"]}" }
    # Need to change the channel to something that fit what the coatch want
    body = { "channel" => "***REMOVED***", "text" => "#{message}" }

    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri, headers)
    request.body = body.to_json
    http.use_ssl = (uri.scheme == "https")
    response = http.request(request)
  end



end
