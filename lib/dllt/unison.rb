module DLLT
  class Unison
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
      command = "unison #{file} socket://#{host}/dictionary/dictionary.txt -auto -batch -force #{file}"
      deferrable = EM::DeferrableChildProcess.open(command)
    end
  end
end
