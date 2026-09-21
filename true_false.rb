require_relative "question"

class TrueFalse < Question
  
  def initialize(prompt, answer)
    super(prompt,answer)
    raise ArgumentError "answer must me boolean(true/false)" unless [true,false].include?(answer)
  end
  
  def ask
    puts prompt + "(sant/falskt)" 
    gets.chomp
  end

  def correct?(reply)
    {"sant" => true, "falskt" => false}[reply.strip.downcase] == answer
  end

end