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

    def self.sync_file(file, client)
      check_reactor

      command = "unison #{file} socket://#{client.uri}:9000/#{file} -auto -batch -force #{file}"

      EM.system(command) do
        puts "Unison finished notifying to #{client.uri}"
        client.update_finished(file)
      end
    end
  end
end
