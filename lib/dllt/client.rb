require 'drb'

module DLLT
  class Client
    include DRbUndumped

    def initialize(server_url, uri, port)
      @uri = uri
      @port = port
      @server_url = server_url
      puts @server_url
      @server = DRbObject.new nil, @server_url
      @server.register(self)
      puts @server.get_clients.inspect
    end

    attr_accessor :uri, :port, :server

    def unregister
      @server.unregister(self)
      DRb.stop_service
    end

    def get_clients
      clients = @server.get_clients
      clients.delete(self)
      clients
    end
  end
end

