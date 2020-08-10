require 'twilio-ruby'
module Messenger
    class SMS
        def send_sms()
            acct_sid = ENV["TWILIO_ACCOUNT_SID"]
            auth_token = ENV["TWILIO_TOKEN"]
            client = Twilio::REST::Client.new(acct_sid, auth_token)
            from = ENV["TWILIO_PHONE"] # Your Twilio number
            to = ENV["TWILIO_COACH"] # Your mobile phone number
            client.messages.create(
            from: from,
            to: to,
            body: "The status of the elevator number: #{$currentElevatorID} has been changed to #{$currentElevatorStatus}."
            )
        end
    end
end