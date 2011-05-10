require 'drb'

module DLLT
  class Client
    include DRbUndumped

    def initialize(url)
      puts url
      @server_url = url
      @server = DRbObject.new nil, @server_url
      @server.register(self)
      puts @server.get_clients.inspect
    end

    def unregister
      @server.unregister(self)
    end
  end
end

#Starts the service, and keeps listening until an interruption happens
DRb.start_service
client = DLLT::Client.new(ARGV[0])

#exit function
quit = Proc.new do
  puts "\nQuitting client"
  client.unregister
  exit 0
end

Signal.trap("TERM", quit)
Signal.trap("INT", quit)

DRb.thread.join


