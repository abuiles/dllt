module DLLT
  module UnisonWatcher
    def unbind
     puts "Unison finished"
   end
  end

  class Unison
    extend Helpers

    def self.start(port)
      puts "starting unison server in port #{port}"
      unless @pid
        @pid = POSIX::Spawn::spawn("unison -socket #{port}")
      end
      puts "started unison server(pid #{@pid})"
    end

    def self.pid
      @pid
    end

    def self.sync_file(file, host)
      check_reactor

      command = "unison #{file} socket://#{host}/#{file} -auto -batch -force #{file}"

      EM.popen(command, UnisonWatcher)
    end
  end
end
