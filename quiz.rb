require_relative "question"

questions = [
  Question.new("Vad heter huvudstaden i Norge?", "Oslo"),
  Question.new("Vilket år släpptes Ruby 1.0?", "1996"),
  Question.new("Vad svarar 5.class?", "Integer"),
  Question.new("Vad är 5 + 7", "12"),
  Question.new("En hund är människans bästa _", "vän"),
]

#q = Question.new("test", "Oslo")        # ArgumentError: prompt must not be empty
#q.answer = "x"                          # NoMethodError: undefined method 'answer='
#q.answer                        # => "Oslo"   att läsa går bra, det meddelandet finns 

score = 0

questions.each do |q|
  reply = q.ask
  if q.correct?(reply)
    puts "Rätt!"
    score += 1
  else
    puts "Fel. Hint: #{q.hint}"
    reply = q.ask
    if q.correct?(reply)
      puts "Rätt!"
      score += 1
    else
      puts "Fel. Rätt svar: #{q.answer}"
    end
  end
end

puts "#{score} av #{questions.length} rätt."
