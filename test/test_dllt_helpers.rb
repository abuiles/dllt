require 'minitest/autorun'
require 'mocha'

require 'dllt'

describe DLLT::Helpers do
  before do
    DLLT::Helpers.extend DLLT::Helpers
  end

  describe "#check_reactor" do
    it "should raise a RunTimeError if EM is not running" do
      EM.stubs(:reactor_running?).returns(false)

      proc { DLLT::Helpers.check_reactor }.must_raise RuntimeError
    end
  end
end
