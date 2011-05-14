module DLLT
  class Guard
    extend Helpers

    def self.start(file)
      check_reactor
      EM.watch_file(file, Handler)
    end

    def self.stop(file)
      check_reactor
      EM.watch_file(file, Handler)
    end
  end
end
