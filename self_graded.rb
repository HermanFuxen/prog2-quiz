class SelfGraded
  attr_reader :prompt, :answer

  def initialize(prompt, answer)
    raise ArgumentError, "prompt may not be empty" if prompt.empty?
    raise ArgumentError, "awnser may not be empty" if answer.empty?
    @prompt = prompt
    @answer = answer
  end

  def ask
    puts prompt
    gets
    puts "Rätt svar: #{answer} \nHadde du rätt?(j/n)"
    gets.chomp
  end

  def hashint?
    false
  end

  def correct?(reply)
    reply == "j"
  end
end