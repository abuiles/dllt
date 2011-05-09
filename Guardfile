$LOAD_PATH.unshift 'lib'

require 'guard/guard'
require 'dllt'

module ::Guard
  class DLLTGuard < ::Guard::Guard
    def run_all
      true
    end

    def run_on_change(paths)
      handlers = []
      paths.each do |path|
        handlers << DLLT::Handler.new(path)
      end

      handlers.each do |hanlder|
        puts "File #{hanlder.file} change"
      end
    end
  end
end

guard "DLLTGuard" do
  watch('dictionary/dictionary.txt')
end

