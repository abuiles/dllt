module DLLT
  module Handler
    def file_modified
      puts "#{path} modified"
      ClientServer.sync_file(path)
    end

    def stop_watching
      puts "stop_watching called"
    end

    def file_moved
      puts "file_moved called"
    end

    def file_deleted
      puts "file_deleted called"
    end
  end
end
