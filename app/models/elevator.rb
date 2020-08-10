require './lib/tasks/send_sms.rb'
require 'slack-notifier'
require 'dotenv'
class Elevator < ApplicationRecord
    belongs_to :column, optional: true
    after_update :send_sms
    
    before_update :slack_notifier

    def send_sms()
      $currentElevatorID = self.id
      $currentElevatorStatus = self.status
      if $currentElevatorStatus.downcase == 'intervention'
          sms = Messenger::SMS.new
          sms.send_sms
      end
    end



    def slack_notifier
        if self.status_changed?
          require 'date'
          current_time = DateTime.now.strftime("%d-%m-%Y %H:%M")
          notifier = Slack::Notifier.new ENV["SLACK_API_WEBHOOK_URL"]  do
            defaults channel: "#elevator_operations"
          end
          notifier.ping "The Elevator #{self.id} with Serial Number #{self.serial_number} changed status from #{self.status_was} to #{self.status} at #{current_time}."
        end
    end
end
