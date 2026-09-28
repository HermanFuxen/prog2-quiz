require_relative "question"

class NumericQuestion < Question
  def initialize(prompt, answer)
    super(prompt,answer)
    raise ArgumentError, "answer must be a number" unless answer.class == Float || answer.class == Integer 
  end

  def correct?(reply)
    (reply.tr(",",".").to_f - answer) <= 0.01
  end

  def hashint?
    false
  end

end

