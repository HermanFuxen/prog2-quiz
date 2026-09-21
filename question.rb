class Question
  
  attr_reader :prompt, :answer # makrokod => skapr nedansående kod(def prompt \n @prompt \n end) för "@promt" & "@anwser"
  
  def initialize(prompt, answer)
    raise ArgumentError, "prompt must not be empty" if prompt.empty?
    raise ArgumentError, "answer must not be empty" if answer.to_s.empty?

    @prompt = prompt #"@"" betyder: det här tillhör objektet(som defineras att tillhöra classen Quiestion), inte metoden initialize, viketär varför den kan användas i andra metoddefinitioner.
    @answer = answer
  end


  #def prompt
  #  @prompt
  #end

  #def answer
  #  @answer
  #end

  #def answer=(new_answer)
  #  @answer = new_answer
  #end

  def ask
    puts prompt                               #OBS, prompt är metoden prompt, vilket retunerar @prompt
    gets.chomp
  end

  def correct?(reply)
    reply.strip.downcase == answer.downcase   #OBS, answer är metoden answer, vilket retunerar @answer
  end

  def hint
    @answer[0]
  end

  def to_s
    "#{prompt} (#{answer})"
  end
end
