require 'posix/spawn'

module DLLT
  class Guard
     @@pid

    def self.start
      @@pid = spawn('guard')
      puts "guard started, pid: #{@@pid}"
    end

    def self.pid
      @@pid
    end
  end
end
