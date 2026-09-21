require_relative "question"

class MultipleChoice < Question

  attr_reader :alternatives

  def initialize(prompt, alternatives, answer)
    raise ArgumentError, "alternatives must be list" unless alternatives.class == Array
    raise ArgumentError, "alternatives must not be empty" if alternatives.length == 0
    raise ArgumentError, "awser must be part of alternatives" unless alternatives.include?(answer)
    
    super(prompt, answer)
    
    @alternatives = alternatives

  end

  def correct?(reply)
    @alternatives[reply.strip.to_i - 1] == @answer
  end

  def ask
    puts prompt
    alternatives.each_with_index do |x,i|
      puts "#{i+1}:#{x}"
    end
    gets.chomp
  end
end
