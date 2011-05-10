module DLLT
  module Handler
    def file_modified
      puts "#{path} modified"
      puts "sending changes"
    end
  end
end
