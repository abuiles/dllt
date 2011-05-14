require 'drb'

module DLLT
  class Client
    include DRbUndumped

    def initialize(server_url, uri, port)
      @updateable = true
      @uri = uri
      @port = port
      @server_url = server_url
      puts @server_url
      @server = DRbObject.new nil, @server_url
      @server.register(self)
    end

    attr_accessor :uri, :port, :server, :updateable

    def unregister
      @server.unregister(self)
      DRb.stop_service
    end

    def get_clients
      clients = @server.get_clients
      clients.delete(self)
      clients
    end

    def prepare_for_update(path)
      @updateable = false
      DLLT::Guard.stop
      puts "The file is going to be updated #{path}"
    end

    def update_finished(path)
      @updateable = true
      DLLT::Guard.start
      puts "Update finished in file  #{path}"
    end
  end
end

