require 'mtik'

class VisitorsController < ApplicationController
  
  def access
      # Be verbose in output
      if session[:auth_token]
      MTik::verbose = true

      # Connect to the device:
      p connection = MTik::command(
        :host    => '192.168.0.200',
          :user    => 'api',
          :pass    => 'rf9kq)pL!',
          :command => [
            "/interface/monitor-traffic",
            "=interface=ether0",
            "=.proplist=rx-bits-per-second,tx-bits-per-second"
          ],
          :limit => 10
        )
      else
        render text: 'lol'
      end
  end
end
