require 'test_helper'

class RailsCheckTest < ActiveSupport::TestCase

  test "#check sets success conditions on successful run" do
    check = Easymon::RailsCheck.new
    results = check.check

    assert_equal(true, results[0])
    assert_equal("ENABLED", results[1])
  end

  test "#check sets failure conditions on a failed run" do
    check = Easymon::RailsCheck.new
    check.stubs(:rails_version_available?).returns(false)
    results = check.check

    assert_equal(false, results[0])
    assert_equal("DISABLED", results[1])
  end
end
