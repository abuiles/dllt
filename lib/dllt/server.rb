require 'drb'

module DLLT
  class Server
    def initialize
      puts "Initializing server..."
      @clients = []
      puts "Done!"
    end

    def register(client)
      puts "#{client.uri}:#{client.port} is registering"
      @clients << client
    end

    def unregister(client)
      puts "#{client.uri}:#{client.port} is unregistering"
      @clients.delete(client)
    end

    def get_clients
      @clients
    end
  end
end
