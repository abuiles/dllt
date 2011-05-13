module DLLT
  module ClientServer
    def self.get_ip
      #taken from http://stackoverflow.com/questions/42566/getting-the-hostname-or-ip-in-ruby-on-rails/42923#42923
      require 'socket'

      orig, Socket.do_not_reverse_lookup = Socket.do_not_reverse_lookup, true
      UDPSocket.open do |s|
        s.connect '64.233.187.99', 1
        s.addr.last
      end
    ensure
      Socket.do_not_reverse_lookup = orig
    end

    def self.start(server_host, client_port)
      client_url = "druby://localhost:#{client_port}"
      server_url = "druby://#{server_host}"
      DRb.start_service(client_url)
      @client = DLLT::Client.new(server_url, get_ip, client_port)
    end

    def self.unregister
      puts "\nQuitting client\n"
      @client.unregister
    end

    def self.sync_file(path)
      puts "TODO::Notify_incoming_change"
      puts "TODO::call unison synv"
      puts "TODO::Notify sync finished"
    end
  end
end
