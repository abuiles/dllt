module DLLT
  module Helpers
    def check_reactor
      raise "Event machine needs to be running" unless EM.reactor_running?
    end
  end
end
