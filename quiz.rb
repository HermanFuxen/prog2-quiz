require_relative "question"
require_relative "multiplechiose"
require_relative "true_false"

questions = [
  Question.new("Vad heter huvudstaden i Norge?", "Oslo"),
  Question.new("Vilket år släpptes Ruby 1.0?", "1996"),
  Question.new("Vad svarar 5.class?", "Integer"),
  Question.new("Vad är 5 + 7", "12"),
  Question.new("En hund är människans bästa _", "vän"),
  MultipleChoice.new("Vilket djur är Kalle Anka?", ["anka", "hund", "drake"], "anka"),
  MultipleChoice.new("Vilket huvudbodnad skall man använmda när man cyklar?", ["mössa", "riddarhjälm", "cyckelhjälm", "helikopterhatt","keps"], "cyckelhjälm"),
  TrueFalse.new("är du vacker", true)
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
  elsif q.class =! TrueFalse      #OBS!!!! NÅGOT GÅR FEL NÄR MAN SKALL KÖRA .CLASS AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
    puts "Fel. Hint: #{q.hint}"
    reply = q.ask
    if q.correct?(reply)
      puts "Rätt!"
      score += 1
    else
      puts "Fel. Rätt svar: #{q.answer}"
    end
  else
    puts "Fel. Rätt svar: #{q.answer}"
  end
end

puts "#{score} av #{questions.length} rätt."
