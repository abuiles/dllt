require 'posix/spawn'

module DLLT
  class Unison
    def self.start(port)
      puts "starting unison server in port #{port}"
      unless @pid
        @pid = spawn("unison -socket #{port}")
      end
      puts "started unison server(pid #{@pid})"
    end

    def self.pid
      @pid
    end
  end
end
