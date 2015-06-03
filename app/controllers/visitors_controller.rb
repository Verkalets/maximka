require 'rubygems'
require 'mtik'

class VisitorsController < ApplicationController

  def access
=begin    
      # Be verbose in output      
      if session[:auth_token]
      #MTik::verbose = true
 
      add_user = ["/system/script/run=.id=*2"]
      
      #/system/script/run=.id=*1
      #/system/script/print

      p MTik::command(
      :host=>'192.168.0.200',
      :user=>'admin',
      :pass=>'ok3mk%lq)',
      :command=>add_user
      )

     
      else
        render text: 'You need authorize'
      end


      begin
      connection = MTik::Connection.new(
        :host=>'192.168.0.200',
        :user=>'admin',
        :pass=>'ok3mk%lq)'
      )
      end

      arp_info  = connection.get_reply('/ip/arp/getall')
      arp_last_info_address = arp_info[-2]['address']
      arp_last_info_mac = arp_info[-2]['mac-address']
      

      connection.close
      ip = arp_last_info_address
      mac = arp_last_info_mac 
    

      command = ["/ip/hotspot/user/add",
      "=name=TEST_USER",
      "=address=ip",
      "=mac-address=mac"
      ]

      p MTik::command(
      :host=>'192.168.0.200',
      :user=>'admin',
      :pass=>'ok3mk%lq)',
      :command=>command
      )
=end

  end

end
