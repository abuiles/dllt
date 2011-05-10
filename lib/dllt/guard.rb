module DLLT
  class Guard
    def self.start(file)
      if EM.reactor_running?
        EM.watch_file(file, Handler)
      else
        raise "Event machine needs to be running"
      end
    end
  end
end
