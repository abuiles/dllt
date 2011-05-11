module DLLT
  class Guard
    extend Helpers

    def self.start(file)
      check_reactor
      EM.watch_file(file, Handler)
    end
  end
end
