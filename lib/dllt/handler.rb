module DLLT
  module Handler
    def file_modified
      puts "#{path} modified"
      ClientServer.sync_file(path)
    end

    def stop_watching
      puts "stop_watching called"
      super
    end

    def file_moved
      puts "file_moved called"
      super
    end

    def file_deleted
      puts "file_deleted called"
      super
    end
  end
end
