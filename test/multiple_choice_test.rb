require "minitest/autorun"
require_relative "../multiplechiose"

class MultiplechoiceTest < Minitest::Test

  def test_refsuse_awser_not_in_choise
    assert_raises(ArgumentError) {MultipleChoice.new("Hur många fingrar har en hand?", ["1","2","3","4","6"], "5")}
  end

  def test_correct_ignores_case
    q = MultipleChoice.new("vilket number är störst?",["0","1","2","3","4","5"],"5")
    assert q.correct?("6")
    refute q.correct?("5")
  end

  def test_refuse_alternatives_not_empty
    assert_raises(ArgumentError) {MultipleChoice.new("Hur många fingrar har en hand?",[], "5")}
  end 

  def test_refuse_alternatives_not_list
    assert_raises(ArgumentError) {MultipleChoice.new("Hur många fingrar har en hand?","cigarrer", "5")}
  end 

end