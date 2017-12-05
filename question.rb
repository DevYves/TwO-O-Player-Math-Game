require './player'

module MathGame

  class Question
    attr_reader :questions

    def initialize
      @num_1 = rand(1..21)
      @num_2 = rand(1..21)
    end

    def random_question
      puts "What is #{@num_1} + #{@num_2}?"
      if (gets.chomp.to_i == (@num_1 + @num_2))
        puts "Right on, right on."
        true
      else
        puts "LIFE LOST"
        false
      end
    end
  end
end
