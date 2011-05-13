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
      puts "Done::Notify_incoming_change"
      notify_incoming_update(path)
      puts "TODO::call unison synv"
      puts "Done::Notify sync finished"
      # notify_finished_update(path)
    end

    def self.notify_incoming_update(path)
      @clients = @client.get_clients
      @clients.each do |client|
        client_url = "druby://#{client.uri}:#{client.port}"
        client_server = DRbObject.new nil, client_url
        client_server.prepare_for_update(path)
      end
    end

    def self.notify_finished_update
      @clients = @client.get_clients
      @clients.each do |client|
        client_url = "druby://#{client.uri}/#{client.port}"
        client_server = DRbObject.new nil, client_url
        client_server.update_finished(path)
      end
    end

    def self.prepare_for_update(path)
      puts "The file is going to be updated #{path}"
    end

    def self.update_finished(path)
      puts "Update finished in file  #{path}"
    end
  end
end
