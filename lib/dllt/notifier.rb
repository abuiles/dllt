require 'drb'

module DLLT
  class Notifier
    def initialize
    end

    def notify_changes
      puts "changed"
    end

    def file_changed      
      clients = @server.get_clients
      clients.each do |c|
        c.notify_changes
      end
    end
  end
end


