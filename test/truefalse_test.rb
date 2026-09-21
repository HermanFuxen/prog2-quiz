require "minitest/autorun"
require_relative "../true_false"

class TrueFaseTest < Minitest::Test

  def refuse_non_boolien_awser
    assert_raises(ArgumentError) {TrueFalse.new("Är lava varmt?", "true")}
  end
end