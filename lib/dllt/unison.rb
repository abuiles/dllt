module DLLT
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
      DLLT.check_reactor

      command = "unison #{file} socket://#{host}/dictionary/dictionary.txt -auto -batch -force #{file}"
      deferrable = EM::DeferrableChildProcess.open(command)
    end
  end
end
