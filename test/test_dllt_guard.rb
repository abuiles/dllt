require 'minitest/autorun'
require 'mocha'

require 'dllt'

describe DLLT::Guard do
  before do
    EM.stubs(:reactor_running?).returns(true)
    EM.stubs(:watch_file)
    @filename = "dictionary"
  end

  it "should check that EM is running" do
    DLLT::Guard.expects(:check_reactor)
    DLLT::Guard.start(@filename)
  end

  it "should call watch_file with the given file and DLLT:Handler" do
    EM.expects(:watch_file).with(@filename, DLLT::Handler)
    DLLT::Guard.start(@filename)
  end
end

