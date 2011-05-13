module DLLT
  module Handler
    def file_modified
      puts "#{path} modified"
      ClientServer.sync_file(path)
    end
  end
end
