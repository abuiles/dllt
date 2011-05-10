require 'posix/spawn'

module DLLT
  class Guard
    def self.start
      unless @pid
        @pid = spawn('guard')
      end
      puts "guard started, pid: #{@pid}"
    end

    def self.pid
      @pid
    end
  end
end
