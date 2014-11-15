require 'mtik'

class VisitorsController < ApplicationController
  
  def access
    # Be verbose in output
    MTik::verbose = true

    # Connect to the device:
    connection = MTik::Connection.new :host => '192.168.0.200', :user => 'api', :pass => 'rf9kq)pL!'
    $reply_limit = 10

    # Execute the command:
    $reply_count = 0
    connection.get_reply_each(
      "/interface/monitor-traffic",
      "=interface=ether1",
      "=.proplist=rx-bits-per-second,tx-bits-per-second"
    ) do |request_object, reply_sentence|
      if reply_sentence.key?('!re')  # We only pay attention to reply sentences
        # Print the reply sentence:
        p reply_sentence

        # Increment the reply counter:
        $reply_count += 1

        # If we've reached our reply goal, cancel:
        if $reply_count >= $reply_limit
          # Cancel this command request:
          request_object.cancel
        end
      end
    end

    connection.close
  end
end
