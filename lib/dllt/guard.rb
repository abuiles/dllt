module DLLT
  class Guard
    extend Helpers

    def self.start(file)
      check_reactor
      @watcher = EM.watch_file(file, Handler)
    end

    def self.stop
      check_reactor

      puts "stopping watcher manually"
      @watcher.stop_watching
    end
  end
end
