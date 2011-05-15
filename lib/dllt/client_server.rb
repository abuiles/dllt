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
      client_url = "druby://#{get_ip}:#{client_port}"
      server_url = "druby://#{server_host}"
      DRb.start_service(client_url)
      @client = DLLT::Client.new(server_url, get_ip, client_port)
    end

    def self.unregister
      puts "\nQuitting client\n"
      @client.unregister
    end


    def self.sync_file(path)
      if @client.updateable
        clients = @client.get_clients
        notify_incoming_update(path, clients)
        sync_clients_file(path, clients)
      else
        puts "TODO::reload file in app"
        puts "Change made by other client"
      end
    end

    def self.sync_clients_file(path, clients)
      clients.each do |client|
        Unison.sync_file(path, client)
      end
    end

    def self.notify_incoming_update(path, clients)
      clients.each do |client|
        client.prepare_for_update(path)
      end
    end
  end
end
