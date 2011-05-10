require 'drb'

module DLLT
  class Server
    def initialize
      puts "Initializing server..."
      @clients = []
      puts "Done!"
    end

    def register(client)
      puts "#{client} is registering"
      @clients << client
    end

    def unregister(client)
      puts "#{client} is unregistering"
      @clients.delete(client)
    end

    def get_clients
      @clients
    end
  end
end

# Starts the servive
DRb.start_service "druby://localhost:9000", DLLT::Server.new
puts DRb.uri

DRb.thread.join
